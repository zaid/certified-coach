# README

## Requirements
### Ruby
You'll need a recent version of Ruby (2.3+) installed.

### Database
You'll need a recent version of Postgres (9.6+) installed.

## Description

This is a basic coach directory listing API which supports the following filters:
  - *country*
  - *province*
  - *postal_code*
  - *name*

## Usage example

```
curl http://localhost:3000/api/v1/coach_directory?country=Canada&province=ON
```
