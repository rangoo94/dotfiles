#!/bin/bash

if variable_is_true "IS_WORK"; then
  header "Setup Swagger helpers"

  bashrc_snippet "Unused port" "
    unused_port() {
      python3 -c \"import socket; s = socket.socket(); s.bind(('', 0)); print(s.getsockname()[1]); s.close()\"
    }
  "

  bashrc_snippet "Swagger UI" "
    swagger() {
      FILE_OR_URL=\$1

      if [ -z \"\$FILE_OR_URL\" ]; then
        echo \"You need to provide the OpenAPI JSON file as 2nd argument\"
        exit 1
      fi

      PORT=\"\$(unused_port)\"

      if [[ \$FILE_OR_URL =~ '^(https?|ftp|file)://[-[:alnum:]\+&@#/%?=~_|!:,.;]+$' ]]; then
        CONTAINER_ID=\"\$(docker run -d -p \"\$PORT:8080\" -e \"SWAGGER_JSON_URL=\$FILE_OR_URL\" swaggerapi/swagger-ui)\"
      elif [ ! -f \"\$FILE_OR_URL\" ]; then
        echo \"The file doesn't exist\"
        return 1
      else
        CONTAINER_ID=\"\$(docker run -d -p \"\$PORT:8080\" -e \"SWAGGER_JSON=/swagger.json\" -v \"\$(realpath \"\$FILE_OR_URL\"):/swagger.json\" swaggerapi/swagger-ui)\"
      fi

      if [ -z \"\$CONTAINER_ID\" ]; then
        echo \"Something went wrong. Check your Docker\"
        return 1
      fi
      trap \"docker rm -f \$CONTAINER_ID\" EXIT

      sleep 1
      open \"http://localhost:\$PORT\"

      docker logs -f \"\$CONTAINER_ID\"
    }
  "
fi
