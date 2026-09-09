# Fiona’s Part-Time Hours — GitHub migration

The upload-ready website is in `website/`. Editable React/Vite code is in
`source/`. It preserves your design, add/edit/delete, and automatic totals only
for months with entries. Supabase will save the hours across devices.

**Status: prepared, not deployed.** You must create a GitHub repository and a
Supabase project and fill in config.json. The original site is unchanged.

## 1. Connect the database

1. Create a project at https://supabase.com/dashboard (you can sign in with GitHub).
2. In its SQL Editor, paste and run `database.sql` from this package.
3. Find your project URL and publishable API key in the project's Connect panel
   or Settings. Edit `website/config.json` with those values:

```json
{"supabaseUrl":"https://YOUR_PROJECT_REF.supabase.co","supabasePublishableKey":"sb_publishable_YOUR_KEY"}
```

Use the **publishable** key beginning `sb_publishable_`. Never put a secret key,
service-role key or database password in GitHub. This package preserves your
requested public no-sign-in access: visitors can read, add, edit and delete
entries in the timesheet table. Its policy does not grant access to other tables.

The SQL imports the sole entry present at export: 2 September 2026, 8 hours.
Rerunning the import does not overwrite that entry if it already exists.
Changes made on the old site after export need a fresh import.

## 2. Put the website on GitHub

1. As `fionakeira`, create a public repository named `fiona-work-hours` at
   https://github.com/new?name=fiona-work-hours . If it already exists, check its
   contents before uploading replacements.
2. Extract this ZIP. In the repository choose **Add file → Upload files**.
3. Upload the CONTENTS of `website/` to the repository root: `index.html`,
   `config.json`, `favicon.svg`, `.nojekyll`, and `assets/`. Do not upload the ZIP
   or the enclosing `website` folder. Commit the files.
4. Open **Settings → Pages**. Select **Deploy from a branch**, `main`, `/ (root)`.
   Save and wait for GitHub's published URL.

Expected address: https://fionakeira.github.io/fiona-work-hours/
This is not a verified live URL yet. No purchased domain is required.

## 3. Verify before switching

Check the new URL on your Hong Kong network. Access there cannot be guaranteed
before testing it. Confirm the initial entry appears, add a temporary entry in a
different month, refresh, and open on a second device. Confirm both devices show
the saved hours, then delete the temporary entry.

## Later source edits

With Node 22.13+ installed, run `npm ci` and `npm run build` inside `source/`.
Set `source/public/config.json` to your project settings before building.
Upload the resulting `dist/` contents to the repository root. The original
ChatGPT-hosted backend is not used by this version.

The static build is verified. Live database and network access need verification
after your accounts are configured.

References:
- https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site
- https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site
- https://supabase.com/docs/guides/getting-started/api-keys
- https://supabase.com/docs/guides/database/postgres/row-level-security
