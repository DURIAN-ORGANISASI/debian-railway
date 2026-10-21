# Contributing

Thank you for helping improve Debian Personal Railway.

## Before opening a change

- Keep changes focused and explain their purpose.
- Do not change deployment behavior merely to update the README or artwork.
- Keep README instructions consistent with `Dockerfile`, `entrypoint.sh`, `system-banner.sh`, and the GitHub Actions workflow.
- Do not commit secrets, passwords, access tokens, API keys, deployment variables, or logs that expose credentials.
- When changing upstream components, update `docs/SOURCES.md` and review the applicable licenses.

## Validation

Before opening a pull request, where available:

1. Build the Docker image: `docker build --tag debian-personal-railway .`
2. Check shell syntax: `bash -n entrypoint.sh system-banner.sh`
3. Verify README links and ensure local SVG assets are still present.
4. Explain any checks that could not be performed.

GitHub Actions builds the image and runs a runtime smoke test for terminal authentication and credential-safe logs. A passing CI run is useful but does not establish that a Railway deployment is live or correctly configured.

## Pull requests

Describe what changed, why it changed, and how it was tested. Keep screenshots and logs free of credentials.
