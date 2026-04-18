FROM rust:1.87-slim-bookworm AS builder

WORKDIR /app

COPY Cargo.toml Cargo.lock ./
COPY .cargo ./.cargo
COPY src ./src

RUN cargo build --release

FROM debian:bookworm-slim

COPY --from=builder /app/build/release/hello_world /usr/local/bin/hello_world

CMD ["hello_world"]
