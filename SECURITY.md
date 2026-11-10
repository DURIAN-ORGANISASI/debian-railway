# Security Policy

## Supported version

Security fixes should target the latest version on the repository's `main` branch.

## Reporting a vulnerability

Please avoid publishing exploit details or secrets in a public issue. Use GitHub's private vulnerability reporting feature for this repository when available. If that option is unavailable, contact the repository maintainers through a private channel available to you.

Include the affected component, impact, reproduction steps, and any relevant sanitized logs. Do not include terminal passwords, Railway access tokens, API keys, private domains, or other live credentials.

## Operational guidance

- Set a unique, randomly generated `TERMINAL_PASSWORD` of at least 16 characters; longer is recommended.
- Store terminal credentials only in Railway Variables or another trusted secret manager.
- Authenticated terminal sessions run as the dedicated unprivileged UID 10001 account inside the application container. The startup entrypoint uses root only to migrate `/data` ownership and then drops privileges before starting ttyd.
- Restrict access to the public domain when sensitive data or tools are available in the terminal.
- On the first startup after the non-root security update, existing files under a Railway Volume mounted at `/data` are recursively assigned to UID/GID 10001; large Volumes may take longer to initialize. A Volume provides persistence, not backup or access control.
- ttyd's WebSocket Origin check and log settings are defense-in-depth measures, not a replacement for strong authentication.
- The terminal user cannot install system packages that require root. Customize and rebuild the image for system-level changes.
- This application container is not a full VPS and does not provide host-level access.
