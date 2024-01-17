# 1. Backend stack

## Context

It is necessary to choose a backend stack that can meet the following requirements:

- The database structure will scale over time.
    - Therefore, it is necessary to have good database documentation.
    - In addition, a migration mechanism is necessary and they can be deployed to production.
- The development must be fast.
- Both the database and the application must be easily deployed locally.
- It must have basic authentication and be quick to implement.
- It must be deployable to a CI/CD.
- It must have storage for images.
- Should work well in an opensource environment.
- Must have good support with Flutter.
- The initial deployment price should not exceed $5.

## Decisions

### 1. Use Supabase for all services

It is better to use all Supabase services, since when using third-party services (for example: Firebase Authentication), the development of the integration will take time and maintenance will be complicated.

#### Database

Supabase uses PostgreSQL. This database scales very well in size. Being relational, the database structure also scales. It has migrations in SQL that are used to keep the history of database changes.

#### Storage

It has a bucket structure. Migrations can be used to create buckets, folders, and security policies. It is simple to learn and configure.

#### Authentication

Authentication is easy to set up and different providers can be added. Policies can be created to keep both the database and storage secure.

#### Development and DevOps

It is easy to develop and maintain since a very intuitive UI is used to create the tables, but it also allows us to control the database with SQL. It has a CLI that helps a lot to speed things up when working locally. In addition, we can make changes locally, create migrations and push them to the production database. It has very good local/production integration. It has good support with Flutter, the different APIs to use are automatically generated. It can be deployed using a CI/CD and perform validations.

### 2. Use Supabase Hosting

Supabase offers us a hosting service with a free tier. This layer is enough to get started. In addition, development is accelerated much more since there are many functionalities that are integrated with Supabase hosting. If the project scales, we can decouple it from Supabase hosting and deploy it on our own infrastructure. ([Ref](https://docs.digitalocean.com/developer-center/hosting-supabase-on-digitalocean/)).
In the future, cost analysis has to be done to make a choice for the main application. Documentation must also be created for when clients require deployment on their own infrastructure.

## Rejected Alternatives

### Firebase

The database structure will not scale. Over time it will be more difficult to maintain the structure when it grows older. It does not accept migrations, any changes to the database can generate errors and we cannot easily track them. It is not easy to simply deploy the entire stack. Authentication could be used, but it will be complicated and will take time to integrate with the database found in another service.

### Django

Implementing authentication is not fast, but it is not complicated to do either; when we want to add more suppliers, it will take more time. Using Django REST API the api is generated in a simple way, but we have to write code to generate the APIs and we will need to write more code to make the connection with the APIs. It is necessary to deploy in a service, the initial assembly of the deployment will take time and will not be free. For storage we will need an external service such as AWS or Google Cloud.
