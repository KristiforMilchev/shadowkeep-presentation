# Shadowkeep - Advanced Book Writing Software

[![License](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://github.com/Shadowkeep/Shadowkeep/blob/master/LICENSE)

Shadowkeep is a powerful and libre (free as in freedom) open-source software designed specifically for authors, writers, and storytellers to create and organize their books with ease. This sophisticated tool provides advanced features for character and location management, along with an intuitive built-in editor that offers quick navigation and seamless editing capabilities. Leveraging the Language Server Protocol (LSP), Shadowkeep allows users to efficiently interact with registered characters and locations to streamline the writing process.

## Key Features

- **Character Management**: Shadowkeep comes equipped with a comprehensive character creation and organization system. Users can easily define new characters, specify their attributes, backgrounds, and arcs. These characters can be effortlessly integrated into the narrative for a well-structured story.

- **Location Places**: With Shadowkeep, writers can create vivid and captivating locations to enrich their storytelling. Whether it's a bustling city, a mysterious forest, or a distant planet, the software allows authors to develop and track various locations and settings throughout their work.

- **Built-in Editor**: Say goodbye to the hassle of switching between different tools while writing your book. Shadowkeep offers a powerful built-in editor that provides a distraction-free environment for seamless writing. The editor supports standard text formatting features and provides an intuitive interface for a smooth writing experience.

- **Quick Access Navigation**: Navigating through lengthy manuscripts can be daunting, but not with Shadowkeep. The software implements a smart and efficient navigation system that allows users to jump between chapters, scenes, and sections effortlessly. This ensures easy access to any part of the book, enhancing productivity and creativity.

- **Language Server Protocol Integration**: Leveraging the Language Server Protocol (LSP), Shadowkeep takes writing assistance to the next level. Users can interact with registered characters and locations directly from the editor, accessing relevant information, attributes, and background details as they write. This powerful integration significantly reduces the need to switch between different resources, providing a seamless writing experience.

## Installation

To get started with Shadowkeep, follow these simple installation steps:

1. Clone the repository to your local machine.

```bash
git clone https://github.com/Shadowkeep/Shadowkeep.git
```

2. Install the required dependencies.


```bash
git clone https://github.com/flutter/flutter.git

```
Set your enviroment path variable and follow the flutter instalation documentation for your operating system.

```bash
flutter doctor (make sure you have no erros, android/ios warnings are not required for the desktop version) 
```

```bash
cd Shadowkeep
git submodule init
git submodule update
```

3. Compile from source.

```bash
flutter pub get

flutter build windows (for windows users)
flutter build linux (for linux users)
flutter build macos (for macos users)

```

## Contributing

We welcome contributions from the community to make Shadowkeep even better. To contribute, follow these steps:

1. Fork the Shadowkeep repository.

2. Create a new branch for your feature or bug fix.

3. Make your modifications and enhancements, ensuring that you write appropriate tests.

4. Run the test suite to check for any errors.
 
5. Commit your changes and push the branch to your forked repository.

6. Open a pull request, and our team will review your contribution.

## License

Shadowkeep is licensed under the GNU General Public License v3.0. Feel free to use, modify, and distribute this software in compliance with the terms of the license. See the [LICENSE](https://github.com/Shadowkeep/Shadowkeep/blob/master/LICENSE) file for more details.

## Support

For any issues, bug reports, or feature requests, please [open an issue](https://github.com/Shadowkeep/Shadowkeep/issues). We appreciate your feedback and are committed to making Shadowkeep the best tool for writers everywhere.

## Acknowledgments

We would like to extend our heartfelt gratitude to all the contributors and supporters of Shadowkeep. Your dedication and passion for open-source software make this project possible.

---

**Note**: Shadowkeep is currently in active development. it is not functional, some features may still be a work in progress. Your feedback and contributions are vital to improving the software and shaping its future. Happy writing with Shadowkeep! Once we have a version that is at a MVP stage i will release a binary build and update the status.