$repositoryRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repositoryRoot

bundle exec jekyll serve