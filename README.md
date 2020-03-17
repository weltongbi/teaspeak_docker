### Usage

```
docker run -d \
	-v teaspeak_files:/opt/teaspeak/files \
	-v teaspeak_db:/opt/teaspeak/database \
	-v teaspeak_certs:/opt/teaspeak/certs \
    	-v teaspeak_logs:/opt/teaspeak/logs \
	-p 10011:10011 -p 30033:30033 -p 9987:9987 -p 9987:9987/udp \
	--restart=unless-stopped --name teaspeak weltongbi/teaspeak
  ```

### Logs and Token
```
docker logs teaspeak
```
