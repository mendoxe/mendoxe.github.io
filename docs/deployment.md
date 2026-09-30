# GitHub Pages

## First publication

1. Create a new **public** GitHub repository. For Lukas's personal site, the recommended name is **`mendoxe.github.io`**, giving `https://mendoxe.github.io/`. Create it empty: leave README, `.gitignore`, and license initialization off because this project already has its own files and has not chosen a source license.
2. Commit this project, connect the new remote, and push `master`, including `pubspec.lock`, the font assets, and generated CV. Ensure the repository's default branch is `master`; the workflow deploys pushes to that branch.
3. In **Settings → Pages → Build and deployment**, select **GitHub Actions**.
4. Run **Build and deploy Pages** from the Actions tab if the first push ran before Pages was configured.

The workflow uses `actions/configure-pages` to discover the base path. It supports both `username.github.io` (root) and ordinary project repositories (`/repository/`). No domain purchase is needed.

## Public or private repository?

Public is the recommended option for the project's free GitHub Pages setup. GitHub Free supports Pages from public repositories. Pages from a private repository requires an eligible paid plan, such as GitHub Pro for a personal account. The published Pages website is still public even when its source repository is private.

The source of a public repository is visible to everyone. This website repository is separate from the app source repositories; publishing it does not publish those apps' source code.

For a project repository named `personal-site`, the default website URL would instead be `https://mendoxe.github.io/personal-site/`. Both forms are supported by the current build. Prefer `mendoxe.github.io` for the personal site's root URL, assuming it is not already in use.

After the first successful workflow run, verify the live home, app and legal deep links, CV download, image/font assets, and an unknown URL returning the custom 404. This is the remaining deployment check; local builds do not prove the GitHub workflow has run successfully.

## Everyday changes

Edit the Dart content/components, run `dart run tool/site.dart check`, commit, and push to `master`. GitHub Actions regenerates the CV and site, verifies links, and publishes the result. Failed checks/builds prevent the deploy job.

To redeploy the already-pushed master branch:

```text
dart run tool/site.dart deploy
```

This wraps `gh workflow run pages.yml --ref master`. Install/authenticate the GitHub CLI first (`gh auth login`). It does not commit or push local changes and does not publish uncommitted files. Watch progress in the repository's Actions tab or with `gh run list`.

## Production preview

```text
dart run tool/site.dart build --base=/your-repository/
dart run tool/site.dart preview
```

The CLI prints the matching local URL. Open a deep app/legal route directly, download the CV, and check an unknown route. `build/jaspr` is the only deployment artifact. `.nojekyll` is generated automatically. The root `docs/` folder is for maintainers, not the Pages publishing source.

## Future custom domain

Configure the custom domain in GitHub Pages and DNS. Re-run the workflow so its base path comes from the updated Pages configuration. Do not hard-code a repository name in source. Custom domains can cost money; the supplied `github.io` domain does not require one.

## Upgrades

Dart is pinned to 3.13.4 in both workflows. Jaspr CLI is pinned in pubspec and the complete resolution is locked. Upgrade deliberately, refresh official local Jaspr skills, regenerate options via a build, and verify both root and prefixed output.

References: [Jaspr deployment](https://docs.jaspr.site/dev/deploying), [creating a GitHub Pages site and plan eligibility](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site), [GitHub Pages publishing sources](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site).
