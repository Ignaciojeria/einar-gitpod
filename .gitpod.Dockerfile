FROM gitpod/workspace-full

USER gitpod

# Install Go
RUN brew install go

# Clone the repository and build the binary
RUN mkdir -p /home/gitpod/bin && \
    git clone https://github.com/Ignaciojeria/einar-cli.git /home/gitpod/bin/einar-cli && \
    cd /home/gitpod/bin/einar-cli && \
    go build -o einar

# Move the binary to the /home/gitpod/bin directory
RUN mv /home/gitpod/bin/einar-cli/einar /home/gitpod/bin/einar

# Cleanup
RUN rm -rf /home/gitpod/bin/einar-cli

# Add /home/gitpod/bin to the PATH
ENV PATH="/home/gitpod/bin:${PATH}"