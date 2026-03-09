# Resume

This is my personal resume site, generated from my PDF resume using Claude.ai and served as a static site with `nginx` in Docker.

### Tech stack
- **Static site**: Single `index.html` generated from my resume
- **Web server**: `nginx:alpine` Docker image
- **CI/CD**: GitHub Actions
- **Container registry**: Docker Hub
- **Runtime**: Kubernetes

### CI/CD pipeline flow
- **Push to `main`**: When I push changes to the `main` branch on GitHub, the `Docker Image CI` workflow is triggered.
- **Build step**: The workflow builds a Docker image using the `Dockerfile` in this repo.
- **Tag format**: During the workflow, a tag is generated in the format `DD-MM-YYYY-UUID` (for example `09-03-2026-1b4e28ba-...`) and applied to the image.
- **Push to registry**: The workflow logs into Docker Hub using `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` secrets, then pushes the image as:
  - `<DOCKERHUB_USERNAME>/<IMAGENAME>:DD-MM-YYYY-UUID`
- **Kubernetes deployment**: A Kubernetes deployment watches for new image tags and automatically updates the running pods when a new tagged image is available.
- **Public URL**: The site is exposed through Kubernetes ingress and is available at:
  - `https://resume.shreyank.in`

Any change committed to `main` will flow through this pipeline and end up automatically deployed at `https://resume.shreyank.in` once the image build and push finish.
