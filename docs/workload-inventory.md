\# Workload inventory



\## Starting commit



I forked MicrosoftLearning/eShopOnWeb and started from commit `4306a451e8e376ab4c11bb68ceb894f55b3947f8`. I haven't changed the application code yet.



\## Running services and ports



Docker Compose starts three services:



\- `eshopwebmvc`: the shop website, available on my PC at `localhost:5106` and listening on port 8080 in the container.

\- `eshoppublicapi`: the API, exposed at `localhost:5200` and listening on port 8080 in the container.

\- `sqlserver`: the local SQL service, exposed on port 1433.



I opened the shop at `http://localhost:5106` and confirmed the page loads.

View the local shop screenshot. Path to the screenshot is (evidence/local-shop.jpeg)



\## Database dependencies



The README describes two databases. One holds catalog and basket data; the other holds application identity data. The web app needs SQL to be ready before it can use them.



\## Local validation



I ran `dotnet test eShopOnWeb.sln` with .NET SDK 8.0.425. All 74 tests passed: 44 unit, 3 integration, 15 Public API integration, and 12 functional. None failed or were skipped.



\## Startup issue and recovery



My first Compose attempt failed because Docker Desktop's Linux engine wasn't running. After starting Docker Desktop, the containers built and started.



The website then showed a SQL error saying it couldn't open the catalog database, along with pending migrations. All three containers showed as running in `docker compose ps`. I restarted `eshopwebmvc`, refreshed the page, and the shop loaded. This suggests the web app first started before SQL and its databases were ready, but I haven't proved the exact timing yet.



