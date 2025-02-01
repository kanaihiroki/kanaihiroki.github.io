# kanaihiroki.github.io

[https://kanaihiroki.github.io/](https://kanaihiroki.github.io/)

# Script Usage

## Create New Page

```sh
$ make page
Enter page title: Enter Title
Enter file name [20250201-enter-title.html]:
```

## Publish to github.io

```sh
$ make publish
```

## Template files

There are manually editable template files.

- template.html: Template file for newly created pages. (not for index.html)
- index.html.m4: Template file for index.html.
- pages.html: Newly created page links are automatically appended to this file.
- header.html,footer.html: Common header and footer.
