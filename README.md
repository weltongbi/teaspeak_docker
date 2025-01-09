# TeaSpeak Docker

A Docker project for TeaSpeak, a free alternative to TeamSpeak 3 Server.

## 🚀 Recent Updates

**January 2025:**
- Updated to Python 3.9 for better compatibility with yt-dlp
- Migrated base image to Debian 11 (bullseye)
- Fixed Python dependency issues
- Optimized Dockerfile for better efficiency

## 🛠️ Prerequisites

- Docker installed on your machine
- Docker Compose (optional, for using docker-compose.yml)
- Ports 9987 (UDP), 10101, and 30303 (TCP) available

## 🚀 How to Use

### Using Docker Pull

```bash
docker pull weltongbi/teaspeak:latest
```

### Running the Container

```bash
docker run -d \
  --name teaspeak \
  -p 9987:9987/udp \
  -p 10101:10101 \
  -p 30303:30303 \
  weltongbi/teaspeak:latest
```

### Using Docker Compose

Create a `docker-compose.yml` file:

```yaml
version: '3.8'

services:
  teaspeak:
    image: weltongbi/teaspeak:latest
    container_name: teaspeak
    restart: unless-stopped
    ports:
      - "9987:9987/udp"
      - "10101:10101"
      - "30303:30303"
    volumes:
      - ./certs:/opt/teaspeak/certs
      - ./db:/opt/teaspeak/database
      - ./files:/opt/teaspeak/files
      - ./log:/opt/teaspeak/logs
    environment:
      - TZ=UTC
```

Then run:

```bash
docker-compose up -d
```

### Building Locally

```bash
git clone https://github.com/weltongbi/teaspeak_docker.git
cd teaspeak_docker
docker build -t weltongbi/teaspeak:latest .
```

## 📁 Directory Structure

The project includes the following important directories (which are git-ignored):
- `certs/` - SSL Certificates
- `db/` - Database files
- `files/` - Server files
- `log/` - Server logs

## 🔧 Configuration

The server can be configured through the `config.yml` file. Default settings are suitable for most use cases.

## 🤝 Contributing

Contributions are always welcome! Please read the contribution guidelines before submitting a pull request.

## 📝 License

This project is under the MIT license. See the [LICENSE](LICENSE) file for details.

## 📞 Support

If you encounter any issues or have questions, please open an issue on our [GitHub repository](https://github.com/weltongbi/teaspeak_docker). For more detailed information and source code, visit the repository.
