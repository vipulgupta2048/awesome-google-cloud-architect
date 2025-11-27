#!/bin/bash

# Link Checker for Obsidian Notes
# This script checks for broken internal links in markdown files

echo "🔗 Checking internal links in Obsidian vault..."
echo "================================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
total_links=0
broken_links=0
checked_files=0

# Function to check if a file exists (case insensitive)
file_exists() {
    local target="$1"
    local dir="$2"
    
    # Remove .md extension if present in link
    target=$(echo "$target" | sed 's/\.md$//')
    
    # Look for file with .md extension
    if [ -f "$dir/$target.md" ]; then
        return 0
    fi
    
    # Case insensitive search
    find "$dir" -iname "$target.md" -type f | grep -q . && return 0
    
    # Look in subdirectories
    find "$dir" -iname "$target.md" -type f | grep -q . && return 0
    
    return 1
}

# Process each markdown file
find . -name "*.md" -type f | while read -r file; do
    echo "📄 Checking: $file"
    checked_files=$((checked_files + 1))
    
    # Extract [[internal links]]
    grep -o '\[\[[^]]*\]\]' "$file" | while read -r link; do
        # Remove [[ and ]]
        clean_link=$(echo "$link" | sed 's/\[\[\(.*\)\]\]/\1/')
        total_links=$((total_links + 1))
        
        # Check if referenced file exists
        if file_exists "$clean_link" "."; then
            echo -e "  ${GREEN}✓${NC} $clean_link"
        else
            echo -e "  ${RED}✗${NC} $clean_link (referenced in $file)"
            broken_links=$((broken_links + 1))
        fi
    done
done

echo ""
echo "📊 Summary:"
echo "==========="
echo "Files checked: $checked_files"
echo "Total links found: $total_links"
echo "Broken links: $broken_links"

if [ $broken_links -eq 0 ]; then
    echo -e "${GREEN}🎉 All links are working!${NC}"
    exit 0
else
    echo -e "${RED}⚠️  Found $broken_links broken links${NC}"
    exit 1
fi