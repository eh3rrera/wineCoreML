# wineCoreML
iOS app that predicts the origin of a wine based on some of its chemical properties.

It uses a CoreML model created from a scikit-learn model using a random forest algorithm with the default parameters. You can find the scripts in this [gist](https://gist.github.com/eh3rrera/7552c319c0351cfda336a555e10f4f57).

Follow the tutorial at the Pusher blog (not yet published).

# Requirements

- Xcode 9 (Beta 2 at least)

# Installation
1. Clone this repository and `cd` into it.
2. Open the project in Xcode 9.
3. In its properties, ensure that the wine.mlmodel file targets the project.
4. Run the project in the simulator.

# Credits
The following data set was used to create the model:
- http://archive.ics.uci.edu/ml/datasets/Wine

# License
MIT
