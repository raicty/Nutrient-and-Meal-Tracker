# Nutrient and Meal Tracker for Dorm Students

A comprehensive database project designed to help dormitory students track their daily meals, monitor nutrient intake, and receive personalized food suggestions based on dietary preferences and recommended daily allowances (RDA).

---

## 🚀 Project Overview

This project implements a robust relational database system for managing and analyzing meal and nutrient data for students living in dorms. It enables:

- **Meal Logging:** Track what each student eats for every meal, every day.
- **Nutrient Analysis:** Monitor intake of key nutrients and compare against RDA.
- **Dietary Preferences:** Support for vegetarian, vegan, gluten-free, and other dietary needs.
- **Ingredient Tracking:** Detailed breakdown of dish ingredients.
- **Personalized Suggestions:** Recommend foods to help students meet their nutritional goals.

---

## 🗂️ Database Schema Highlights

- **students:** Stores student info and dietary preferences.
- **daywise_dishes:** Catalogs daily dishes, meal types, and links to nutrients.
- **ingredients & dish_ingredient_link:** Normalized ingredient tracking for each dish.
- **nutrients & rda:** Nutrient values per dish and recommended daily allowances.
- **meal:** Logs each student's meal consumption.
- **suggestions:** Stores food suggestions for nutrient deficiencies.

---

## 💡 Key Features

- **Relational Integrity:** Extensive use of foreign keys to maintain data consistency.
- **Extensible Design:** Easily add new nutrients, dishes, or dietary categories.
- **Sample Data:** Pre-populated with realistic student, meal, and nutrient data for demonstration and testing.
- **SQL Best Practices:** Uses normalization, indexing, and constraints for performance and reliability.

---

## 🏁 Getting Started

1. **Clone the Repository**
   ```sh
   git clone https://github.com/yourusername/Nutrient-and-Meal-Tracker.git
   ```
