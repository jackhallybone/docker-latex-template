# Use a lightweight base image
FROM debian:bookworm-slim

# Set environment variables to prevent interactive prompts during installation
ENV DEBIAN_FRONTEND noninteractive

# Install LaTeX (only the required texlive components) and latexmk for building
RUN apt-get update && apt-get install -y \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-bibtex-extra \
    latexmk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory inside the container
WORKDIR /app

# App code mounting and starting command are in the docker-compose