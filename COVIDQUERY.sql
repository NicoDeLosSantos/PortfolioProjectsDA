
Select *
From PortfolioProject1..CovidDeaths
where continent is not null
order by 3,4


Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject1..CovidDeaths
where continent is not null
order by 1,2

-- Comparando Total de casos vs Total deaths
-- Porcentaje de muerte de personas que contrajeron covid (Argentina)
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPorcentage
From PortfolioProject1..CovidDeaths
Where location like '%Argen%'
and continent is not null
order by 1,2

-- Comparando Total Cases vs Population--
-- Muestra el porcentaje de la poblacion con COVID
Select Location, date, total_cases, total_deaths, (total_cases/population)*100 as tienen_covid
From PortfolioProject1..CovidDeaths
Where location like '%Argen%'
and continent is not null
order by 1,2

--Buscando el Pais con mayor tasa de infeccion
Select Location, population, MAX(total_cases) as CantidadCasos, MAX(total_cases/population)*100 as PorcentajeInfectados
From PortfolioProject1..CovidDeaths
where continent is not null
Group by location, population
order by PorcentajeInfectados desc

--Muestra TotalMuertes ordenados por el pais con mayores muertes
Select Location, MAX(cast(total_deaths as int)) as TotalMuertes
From PortfolioProject1..CovidDeaths
Where continent is not null
Group by location, population
order by TotalMuertes desc


-- Muertes la suma total de muertes p
Select continent, MAX(cast(total_deaths as int)) as TotalMuertes
From PortfolioProject1..CovidDeaths
Where continent is not null
Group by continent
order by TotalMuertes desc


--Totalde casos, muertes y Porcentaje de muerte por dia en el mundo
Select date, SUM(new_cases) as total_casos, SUM(cast(new_deaths as int)) as total_muertes, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From PortfolioProject1..CovidDeaths
Where continent is not null
Group by date
order by 1,2

--Total de casos, de muertes y Porcentaje del mundo
Select SUM(new_cases) as total_casos, SUM(cast(new_deaths as int)) as total_muertes, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From PortfolioProject1..CovidDeaths
Where continent is not null
order by 1,2



-- Total Population
---  !! ARREGLAR !!! 


--With PopvsVac (Continent, Location, Date, Population, New_Vaccination, TotalVacunados)
--as
--(
--Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(vac.new_vaccinations) 
--OVER (Partition by dea.location Order by dea.location, dea.Date) as TotalVacunados
--From PortfolioProject1..CovidDeaths dea
--Join PortfolioProject1..CovidVaccinations vac
--	On dea.location = vac.location
--	and dea.date = vac.date
--Where dea.continent is not null
--Order by 2, 3
--)
--Select *, (TotalVacunados/Population)*100
--From PopvsVac

--END

