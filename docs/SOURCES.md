# Sources, attribution, and license

This file records upstream components and visual assets used by Debian Personal Railway.

## Base image and runtime

- **Debian 13 (Trixie):** official container image, `debian:trixie-slim`. Project homepage: https://www.debian.org/ — image metadata and package support: https://hub.docker.com/_/debian
- **ttyd 1.7.7:** https://github.com/tsl0922/ttyd — binary assets are downloaded from the project's GitHub Releases for AMD64 and ARM64. ttyd is an upstream dependency and retains its own license.
- **Railway:** https://railway.com/ — hosting and persistent volume service, subject to Railway's own terms.
- **Docker:** https://www.docker.com/ — container build/runtime technology.

## Debian logo

The README uses the Debian Project's official **open-use logo**:
https://www.debian.org/logos/openlogo-nd.svg

The Debian logo page documents the open-use versions and their licensing. The logo is Copyright © 1999 Software in the Public Interest, Inc. and is offered under the GNU Lesser General Public License version 3 or later, or (at the user's option) the Creative Commons Attribution-ShareAlike 3.0 Unported License. See the official guidance: https://www.debian.org/logos/

The logo is linked to https://www.debian.org/ as requested in Debian's logo guidance. Its presence identifies the base distribution and does not indicate official Debian endorsement.

## Original documentation artwork

These vector illustrations were authored for this repository and do not depict official product screenshots:

- `docs/hero.id.svg`
- `docs/hero.en.svg`
- `docs/architecture.svg`
- `docs/architecture.en.svg`

They illustrate the documented architecture rather than guarantee a specific live Railway configuration or deployment state.

## Repository license scope

Project source files and original materials covered by the root `LICENSE` are released under the MIT License.

The repository's MIT license does **not** override the terms of Debian's logo, ttyd, Debian packages, Docker, Railway, or other third-party components. Each upstream component remains subject to its respective terms. Refer to the root `LICENSE` and the upstream notices for exact conditions.
