# Hotel Booking Analysis Dashboard

## Project Overview
An interactive Excel dashboard that analyzes hotel booking data to track revenue, booking volume, and cancellations across hotel types, customer types, and guest segments. The goal is to give hotel management a clear, filterable view of booking performance and cancellation behavior to support operational and revenue decisions.

## Dataset
- The Excel workbook (compressed as `hotel_booking_excel_file.zip`) contains the source reservation data used to build the dashboard.
- Dashboard fields include: hotel, arrival_date_year, customer_type, market segment, guest type, and cancellation status.
- Years covered: 2015, 2016, 2017.
- Hotel types: City Hotel, Resort Hotel.
- Customer types: Contract, Group, Transient, Transient-Party.
- Total bookings analyzed: 119,390.

## Tools & Technologies
- Microsoft Excel
- PivotTables
- Charts (line, bar, pie/donut, combo)
- Interactive filters (Filter Panel by year, hotel, and customer type)

## Project Workflow
1. Data Collection
2. Data Cleaning
3. Exploratory Data Analysis
4. KPI Calculation (PivotTables)
5. Dashboard & Chart Design
6. Interactive Filtering

## Data Cleaning & Preparation
Data cleaning and preprocessing were performed prior to analysis (as part of the project's Excel workflow). Specific cleaning steps are not visible in the dashboard output itself and are therefore not detailed here.

## Analysis & Visualization
The dashboard includes:
- KPI cards: Total Revenue ($42,723,498), Total Booking (119,390), Cancellation Rate (37.04%)
- Revenue by Market Segment: Online TA, Offline TA/TO, Direct, Groups, Corporate, Aviation, Complementary
- Bookings by Month: monthly booking trend line
- Booking by Guest Type: Couple, Family, Single (pie chart)
- Cancellation by Customer Type: Transient, Transient-Party, Contract, Group
- Monthly Bookings & Revenue: combined bar and line chart
- Filter Panel: arrival_date_year, hotel, customer_type

## Key Insights
- Online TA is by far the leading market segment, generating $23.9M in revenue - nearly 3x the next-highest segment (Offline TA/TO, $8.15M).
- Couples represent the majority of bookings at 73.27%, followed by Single guests (18.91%) and Families (7.82%).
- The overall cancellation rate is high at 37.04%, with Transient customers accounting for the large majority of cancellations (36,514 out of ~44,200 total cancellations shown).
- Bookings peak in August (13,877) before trending downward toward the end of the year.
- Monthly revenue closely follows the booking trend, peaking around July-August (up to ~$7.9M).

## Project Structure
```text
Assignment 4 Final Project/
├── README.md
├── Ass4.pptx
├── Assignment4_FinalProject.pdf
├── Best Project.png
├── Final Project Dashboard.png
├── Grade.png
├── Microsoft Excel Assignment_4(Final Project).pdf
├── Video Project.mp4
└── hotel_booking_excel_file.zip
```

## How to Use
1. Extract `hotel_booking_excel_file.zip` and open the workbook in Microsoft Excel.
2. Use the Filter Panel to filter by arrival_date_year, hotel, or customer_type.
3. Navigate between the Analysis and Data views using the left-side menu buttons.
4. `Video Project.mp4` contains a walkthrough of the dashboard; `Assignment4_FinalProject.pdf` and `Microsoft Excel Assignment_4(Final Project).pdf` contain the written assignment report; `Ass4.pptx` is the accompanying presentation.

## Project Objective
Demonstrates the ability to clean and explore real-world booking data in Excel, build KPI- and PivotTable-driven visuals, and design an interactive, filterable dashboard for hotel performance monitoring.

## Author
**Adham Ashraf**
