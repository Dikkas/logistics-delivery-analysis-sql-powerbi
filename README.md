# Delivery Performance Dashboard (Power BI & SQL)

Exploratory analysis and interactive dashboard development based on delivery data. This project showcases skills in SQL (for data transformation) and Power BI (for modeling, KPIs, and visualization).

---

## Objective

To build a full analytical solution that monitors delivery performance with a focus on:

- Average delivery times
- Performance by destination, customer, and transport mode
- Percentage of on-time and failed deliveries

---

## Technical Overview

### Data Sources

Three CSV files were used as input::

- `Deliveries.csv`
- `Customers.csv`
- `Routes.csv`

Initial cleaning and consolidation were done in SQL using SQLite. The final dataset (`Deliveries_Clean.csv`) was imported into Power BI.

### SQL Processing

SQL scripts were used for:

- Creating source tables
- Identifying inconsistencies and cleaning the data
- Creating the final table `Deliveries_Clean` with calculated fields

| SQL File            | Purpose                                       |
|---------------------|-----------------------------------------------|
| `01_setup.sql`      | Table information for CSV import              |
| `02_cleaning.sql`   | Building the clean table `Deliveries_Clean`   |
| `03_kpis.sql`       | Basic metric calculations                     |
| `04_data_table.sql` | Example of Export-ready final dataset         |

The clean dataset was exported to CSV and used in Power BI.

### Power BI Modeling

The Power BI model follows a star schema:

- **Fact Table**: `Deliveries_Clean`
- **Dimensions**: `Customers`, `Routes`
- **Measures Table**: `MeasuresTable` (with DAX calculations)

Relationships:

| From               | To               | Key Field     | Relationship |
|--------------------|------------------|---------------|--------------|
| `Deliveries_Clean` | `Routes`         | `Route_ID`    | Many-to-One  |
| `Deliveries_Clean` | `Customers`      | `Customer_ID` | Many-to-One  |

---

## Dashboard Features

The report includes two interactive pages designed for operational monitoring.

### Report Pages

| Page                      | Purpose                                                                    |
|---------------------------|----------------------------------------------------------------------------|
| **Delivery Overview**     | High-level overview of volume, trends and top destinations                 |
| **Performance by Status** | In-depth view of delivery performance by status (on-time, delayed, failed) |

### Page 1 - Delivery Overview

- **KPIs**: Total Deliveries, Average Delivery Time, % On-Time, Failed Deliveries
- **Slicers**: Status, Customer Name, Industry
- **Charts**:
  - Top 10 Destinations (column chart)
  - Monthly Trends (line chart)

### Page 2 - Performance by Status

- **KPIs**: Same as above
- **Slicers**: Destination, Mode, Customer Name
- **Visuals**:
  - Status Breakdown (column chart)
  - Detailed Deliveries Table
  - Summary Table per Destination with averages and % values

---

## Key DAX Measures

| Measure                    | Description                                               |
|----------------------------|-----------------------------------------------------------|
| `Total Deliveries`         | Total number of deliveries                                |
| `Average Delivery Time`    | Average days from dispatch to delivery                    |
| `On-Time Deliveries %`     | Percentage of deliveries made within deadline             |
| `Failed Deliveries`        | Total number of failed deliveries                         |
| `Delivery Days`            | Days between dispatch and delivery (calculated in SQL)    |

---

## Folder Structure
<pre><code>
delivery-performance-dashboard/
│
├── README.md
├── PowerBI_Report.pbix
│
├── data/
│   ├── Deliveries.csv
│   ├── Customers.csv
│   ├── Routes.csv
│   └── Deliveries_Clean.csv
│
├── sql/
│   ├── 01_setup.sql
│   ├── 02_cleaning.sql
│   ├── 03_kpis.sql
│   └── 04_data_table.sql
│
├── assets/
│   ├── DeliveryOverview.png # dashboard preview image for GitHub
│   ├── PerformancebyDestination.png
│   └── Report_PDF.pdf  
</code></pre>
---

## Notes

- Data is fictional and created for portfolio purposes.
- Designed to simulate a real-world logistics analysis scenario.
- Developed with clarity, modularity and visual storytelling in mind.

---

## Skills Applied

- SQL (SQLite) for data cleaning and transformation  
- Power BI for modeling, DAX measures and report design  
- Business analysis and visual communication  
- Structured delivery of analytical projects 

---

## License

This project is open for educational and demonstrative purposes. Data is synthetic.
