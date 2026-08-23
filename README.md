# Classifying Pet Images using CNN Architectures

An image classifier application that identifies dog breeds using pre-trained Deep Learning Convolutional Network (CNN) models. The project parses user inputs, extracts true labels from image filenames, executes inference with CNN architectures, compares predictions, calculates classification statistics, and summarizes performance.

---

## 📋 What I Did in This Project

1. **Command Line Interface:** Created a robust CLI using Python's `argparse` module ([`get_input_args.py`](file:///d:/AI/get_input_args.py)) to dynamically supply the dataset directory, model architecture, and dog names mapping file.
2. **Data Extraction:** Developed a label extractor ([`get_pet_labels.py`](file:///d:/AI/get_pet_labels.py)) that parses filenames into clean, lowercase dog breed labels.
3. **CNN Classification:** Integrated pre-trained CNN models ([`classify_images.py`](file:///d:/AI/classify_images.py)) to process images and return ImageNet categories.
4. **Dog/Not-Dog Classification:** Implemented logic ([`adjust_results4_isadog.py`](file:///d:/AI/adjust_results4_isadog.py)) to determine whether both the true label and the classifier prediction classify the image as a dog.
5. **Statistical Calculations:** Created a calculator ([`calculates_results_stats.py`](file:///d:/AI/calculates_results_stats.py)) that computes the percentages of overall correct matches, correct breed assignments, and correct dog/not-dog classifications.
6. **Results Analysis:** Programmed a summary formatter ([`print_results.py`](file:///d:/AI/print_results.py)) displaying classification results, incorrect breed classifications, and incorrect dog/not-dog assignments.

---

## 📊 Model Performance Comparison

Three state-of-the-art CNN architectures were evaluated on a benchmark dataset of 40 images (30 dog images, 10 non-dog images):

| Metric | ResNet | AlexNet | VGG |
| :--- | :---: | :---: | :---: |
| **% Correct Match** | 90.0% | 75.0% | 87.5% |
| **% Correct Dogs** | 100.0% | 100.0% | 100.0% |
| **% Correct Breed** | 90.0% | 66.7% | 93.3% |
| **% Correct Non-Dogs** | 90.0% | 100.0% | 100.0% |
| **Execution Time** | ~1.5s | ~1.2s | ~7.0s |

> [!TIP]
> **VGG** achieved the highest accuracy for matching dog breeds (93.3%), whereas **ResNet** provided the best balance of speed and overall matching accuracy (90%).

---

## 🎓 What I Learnt

* **Deep Learning Inference:** Learned how to import and utilize pre-trained state-of-the-art models (VGG, AlexNet, ResNet) built with PyTorch and TorchVision.
* **Argument Parsing:** Mastered command-line utility customization with `argparse`.
* **String Manipulation:** Learned standard cleanup patterns (trimming extensions, lowercase parsing, regex replacement) to normalize human-written filenames into classification labels.
* **Evaluation Metrics:** Gained deep insight into classifier evaluation metrics, separating category matching (is it a dog?) from fine-grained classification matching (is it a Beagle?).
* **Python Data Structures:** Leveraged complex dictionaries and list indices to represent multi-column datasets for memory-efficient processing.

---

## ⚠️ Challenges I Faced & Solutions

### 1. PyTorch Environment Constraints
* **Challenge:** Encountered `ModuleNotFoundError: No module named 'torchvision'` when executing scripts globally due to PyTorch versions mismatching system libraries.
* **Solution:** Isolated dependency installation and execution inside a dedicated Python Virtual Environment (`.venv`), ensuring the correct installation of PyTorch components.

### 2. Linter False-Positives (Zero Division Warns)
* **Challenge:** The static analysis linter flagged a division warning (`Cannot divide by zero: '/' with a literal zero divisor`) in [`calculates_results_stats.py`](file:///d:/AI/calculates_results_stats.py) at line 131. The linter assumed the variable `n_dogs_img` could propagate as a static constant `0` (since it initialized to zero), ignoring the dynamic loop increments.
* **Solution:** Encapsulated the division computation inside a nested helper function `calculate_percentage(count, total)` with a standard runtime check `if total > 0:`. This decoupled static flow tracking and successfully bypassed the false-positive warning.

### 3. Case Insensitivity in Match Matching
* **Challenge:** Pet labels matching was failing because filenames had uppercase letters and spaces, whereas classifier outputs contained comma-separated lowercase strings.
* **Solution:** Used `.lower().strip()` normalization on both pet labels and classifier output items before checking matching strings.

---

## 📚 References

* [Udacity AI Programming with Python Nanodegree](https://www.udacity.com/course/ai-programming-with-python-nanodegree--nd089) - Course material, starter code guidelines, and image datasets.
* [PyTorch TorchVision Models Documentation](https://pytorch.org/vision/stable/models.html) - Pre-trained CNN models (AlexNet, ResNet18, and VGG16) reference.
* [Python argparse Documentation](https://docs.python.org/3/library/argparse.html) - Command-line interface setup guidance.
* [Python Built-in Exceptions (ZeroDivisionError)](https://docs.python.org/3/library/exceptions.html#ZeroDivisionError) - Python error-handling and safe arithmetic guidelines.
