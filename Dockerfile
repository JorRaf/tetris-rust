FROM rust:1.87-slim-bookworm AS builder

WORKDIR /app

COPY Cargo.toml Cargo.lock ./
COPY .cargo ./.cargo
COPY src ./src

RUN cargo build --release

FROM debian:bookworm-slim

COPY --from=builder /app/build/release/tetris_rust /usr/local/bin/tetris_rust

CMD ["tetris_rust"]
