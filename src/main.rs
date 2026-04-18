fn greeting() -> &'static str {
    "Hello, world!"
}

fn main() {
    println!("{}", greeting());
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn returns_expected_greeting() {
        assert_eq!(greeting(), "Hello, world!");
    }
}
