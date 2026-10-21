# Security Policy

## Supported version

Security fixes should target the latest version on the repository's `main` branch.

## Reporting a vulnerability

Please avoid publishing exploit details or secrets in a public issue. Use GitHub's private vulnerability reporting feature for this repository when available. If that option is unavailable, contact the repository maintainers through a private channel available to you.

Include the affected component, impact, reproduction steps, and any relevant sanitized logs. Do not include terminal passwords, Railway access tokens, API keys, private domains, or other live credentials.

## Operational guidance

- Set a unique, randomly generated `TERMINAL_PASSWORD` of at least 16 characters; longer is recommended.
- Store terminal credentials only in Railway Variables or another trusted secret manager.
- Anyone authenticated to the web terminal has root privileges inside the application container.
- Restrict access to the public domain when sensitive data or tools are available in the terminal.
- A Railway Volume at `/data` provides persistence, not backup or access control.
- ttyd's WebSocket Origin check and log settings are defense-in-depth measures, not a replacement for strong authentication.
- This application container is not a full VPS and does not provide host-level access.
