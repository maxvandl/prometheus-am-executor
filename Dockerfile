# Stage 1: Build the Go application
FROM golang:1.24 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy Go modules files and download dependencies


# Copy the application source code
COPY . .

# Build the application
RUN go test -count 1 -v ./...

RUN go build

# Stage 2: Create a minimal runtime image
FROM bash:latest

# Install necessary dependencies (optional)
# RUN apk --no-cache add ca-certificates

# Set the working directory inside the container
WORKDIR /root/

# Copy the compiled binary from the builder stage
COPY --from=builder /app/prometheus-am-executor .

# Expose application port (change if needed)
# EXPOSE 8080

# Run the application
# CMD ["./prometheus-am-executor"]
