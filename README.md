# LearnSphere - EdTech Company Data Analysis

An end-to-end data analytics project for **LearnSphere**, a fictional South African online learning company. The project takes messy raw enrollment data through cleaning, SQL analysis, and a Power BI dashboard to answer key business questions about student growth, revenue, course performance, and marketing.

![Power BI Overview](Power%20BI/Overview.png)

## Project Overview

LearnSphere sells online courses to students across South Africa. This project simulates a real analytics workflow: a stakeholder hands over raw, imperfect data, and the task is to clean it, model it, query it, and present findings that support decision-making.

**Workflow:** Raw data → Excel cleaning → MySQL database & analysis → Power BI dashboard

## Business Questions Answered

- How have student signups and enrollment volume trended over the last 3 years?
- Which course categories generate the most revenue, and which have the highest dropout rate?
- What is the overall course completion rate, and which courses/instructors underperform?
- Which signup source and device type bring in the most paying, completing students?
- Which cities/provinces should LearnSphere prioritize for marketing spend?
- Does average student rating correlate with course completion rate?
- What percentage of enrollments used a discount, and does that affect completion?
- Who are the top 10 instructors by revenue and by average rating?

## Key Findings

- **Ratings vs. completion:** No strong correlation was found between average student ratings and completion rates - higher-rated courses didn't consistently see higher completions.
- **Discounts vs. completion:** Discounted enrollments completed at a rate only ~1.16 percentage points different from full-price enrollments, suggesting discounting has little meaningful effect on completion.

## Repository Structure

```
LearnSphere---EdTech-Company/
├── Excel/
│   ├── LearnSphere_original_dataset.xlsx   # Raw, uncleaned data
│   └── LearnSphere_cleaned_dataset.xlsx    # Cleaned data, ready for SQL import
├── SQL/
│   └── learnsphere_analysis.sql            # Schema setup + business question queries
├── Power BI/
│   ├── LearnSphere.pbit                    # Power BI dashboard template
│   ├── Overview.png
│   ├── Course Performance.png
│   ├── Students & Markerting.png
│   └── Instructors.png
├── images/                                 # Icons used in the Power BI report
└── Instructions.pdf                        # Original project brief
```

## Data Model

The cleaned dataset contains six related tables:

| Table | Description |
|---|---|
| `students` | Student demographics, signup source/device, city & province |
| `courses` | Course catalog with category, level, price (ZAR), and instructor |
| `instructors` | Instructor profiles, specialty, experience, and rating |
| `enrollments` | Enrollment records: status, completion %, amount paid, payment method |
| `reviews` | Student reviews and ratings linked to enrollments |
| `lookup_table` | City-to-province reference table used for data validation |

A `Findings` sheet in the cleaned workbook documents the data quality issues addressed during cleaning (e.g. city/province mismatches, invalid ages, malformed phone numbers, and inconsistent payment amounts).

## Tools Used

- **Excel** - initial data cleaning, validation, and data quality documentation
- **MySQL** - database creation and business-question queries (`SQL/learnsphere_analysis.sql`)
- **Power BI** - interactive dashboard with four report pages: Overview, Course Performance, Students & Marketing, and Instructors

## Dashboard Preview

| Overview | Course Performance |
|---|---|
| ![Overview](Power%20BI/Overview.png) | ![Course Performance](Power%20BI/Course%20Performance.png) |

| Students & Marketing | Instructors |
|---|---|
| ![Students & Marketing](Power%20BI/Students%20&%20Markerting.png) | ![Instructors](Power%20BI/Instructors.png) |

## How to Reproduce

1. **Clean data:** Review `Excel/LearnSphere_original_dataset.xlsx` and `Excel/LearnSphere_cleaned_dataset.xlsx` to see the cleaning steps applied (see the `Findings` sheet for a summary).
2. **Load into MySQL:** Import each sheet of the cleaned workbook as a table (`students`, `courses`, `instructors`, `enrollments`, `reviews`, `lookup_table`), then run `SQL/learnsphere_analysis.sql` to recreate the analysis.
3. **Explore the dashboard:** Open `Power BI/LearnSphere.pbit` in Power BI Desktop and point it to your MySQL database (or the cleaned Excel file) to refresh the visuals.

## Author

**Tendai Teremuka**
Built as a portfolio project to demonstrate the full analytics pipeline - from raw data to business-ready insight - using Excel, SQL, and Power BI.
