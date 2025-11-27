# Quartz + GitHub Pages Setup Guide

This guide explains how to deploy your GCP Professional Cloud Architect notes as a static website using Quartz and GitHub Pages.

## What is Quartz?

Quartz converts your Obsidian vault (Markdown files with Obsidian-style `[[links]]`) into a beautiful, fast static website with features like:
- Graph view of interconnected notes
- Full-text search
- Dark mode
- Mobile-responsive design
- Backlinks and table of contents
- Fast navigation with SPA

## Prerequisites

- Node.js 20+ installed
- Git repository already set up (✅ you have this)
- GitHub account with this repo

## Setup Steps

### 1. Install Dependencies

Quartz has been integrated into your repository. Simply install the dependencies:

```bash
npm install
```

### 2. Configuration Files

The following files have been created for you:

- **`quartz.config.ts`**: Main configuration (site title, theme, plugins)
- **`quartz.layout.ts`**: Page layout and components
- **`.github/workflows/deploy.yml`**: Automated deployment to GitHub Pages

### 3. Test Locally

```bash
npm run dev
```

Visit `http://localhost:8080` to preview your site.

### 4. Enable GitHub Pages

1. Go to your GitHub repository settings
2. Navigate to **Settings** → **Pages**
3. Under **Source**, select **GitHub Actions**
4. Save the settings

### 5. Deploy

```bash
git add .
git commit -m "Add Quartz configuration for GitHub Pages"
git push origin master
```

The GitHub Action will automatically:
- Sync your content to the `content/` folder
- Build your Quartz site
- Deploy to GitHub Pages
- Your site will be live at: `https://vipulgupta2048.github.io/gcp-pca/`

**Note:** Your markdown files stay in the root and folders as usual. The GitHub Action automatically copies them to `content/` during build.

## Customization

### Update Site Metadata

Edit `quartz.config.ts`:

```typescript
pageTitle: "Your Custom Title",
baseUrl: "yourusername.github.io/your-repo",
```

### Change Theme Colors

Modify the `colors` section in `quartz.config.ts` to match your preferences.

### Add Custom Domain (Optional)

1. Add a `CNAME` file to the root:
   ```
   your-domain.com
   ```
2. Configure DNS settings with your domain provider
3. Enable custom domain in GitHub Pages settings

## File Structure

```
gcp-pca/
├── quartz.config.ts          # Main Quartz configuration
├── quartz.layout.ts          # Layout and components
├── .github/workflows/
│   └── deploy.yml            # GitHub Actions deployment
├── Concepts/                 # Your content (unchanged)
├── case studies/             # Your content (unchanged)
└── ...                       # All your existing notes
```

## Workflow

1. **Edit notes** in Obsidian as usual
2. **Commit changes** to Git
3. **Push to GitHub**
4. **Automatic deployment** via GitHub Actions
5. **Live site updates** in ~2-3 minutes

## Features Enabled

- ✅ Obsidian-style `[[wikilinks]]` converted automatically
- ✅ Graph view showing note connections
- ✅ Full-text search across all notes
- ✅ Syntax highlighting for code blocks
- ✅ LaTeX math rendering
- ✅ Table of contents for long documents
- ✅ Backlinks showing what links to each page
- ✅ Mobile-responsive design
- ✅ Dark/light mode toggle
- ✅ RSS feed and sitemap

## Troubleshooting

### Build Fails

Check the GitHub Actions logs:
1. Go to **Actions** tab in your repo
2. Click on the failed workflow
3. Review error messages

Common issues:
- Missing dependencies: Run `npm install`
- Invalid config: Check `quartz.config.ts` syntax
- Broken links: Fix any `[[broken links]]` in your notes

### Site Not Updating

1. Verify GitHub Pages is enabled in Settings
2. Check that the workflow completed successfully
3. Clear browser cache
4. Wait 2-3 minutes for CDN propagation

### Local Preview Not Working

```bash
# Clean build cache
rm -rf .quartz-cache public

# Rebuild
npx quartz build --serve
```

## Advanced Configuration

### Exclude Files from Site

Edit `quartz.config.ts`:

```typescript
ignorePatterns: ["private", "templates", ".obsidian", "drafts"],
```

### Add Analytics

Update `quartz.config.ts`:

```typescript
analytics: {
  provider: "plausible",
  // or "google" for Google Analytics
},
```

### Custom Components

Edit `quartz.layout.ts` to add/remove components:
- `Component.Graph()`: Interactive graph view
- `Component.TableOfContents()`: Page TOC
- `Component.Backlinks()`: Show backlinks
- `Component.Explorer()`: File tree navigation

## Resources

- [Quartz Documentation](https://quartz.jzhao.xyz/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Obsidian Documentation](https://help.obsidian.md/)

## Support

If you encounter issues:
1. Check Quartz documentation
2. Review GitHub Actions logs
3. Open an issue in this repository

---

**Your notes are now ready to be shared with the world! 🚀**
