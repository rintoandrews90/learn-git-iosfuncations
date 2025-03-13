# Git - iOS Foundations

[https://iosfoundations.com/](https://iosfoundations.com/)

## Setup

```swift
git config --global user.name "Matteo Manferdini"
git config --global user.email matteo@purecreek.com
git config --global init.defaultBranch master
```

<aside>
💡

**Changing Git’s default text editor, so you don’t get stuck inside Vim**

</aside>

```swift
git config --global core.editor /Applications/TextEdit.app/Contents/MacOS/TextEdit
```

## Create Git Repo

[https://iosfoundations.com/lesson/git-for-ios-development-lesson-1-3/](https://iosfoundations.com/lesson/git-for-ios-development-lesson-1-3/)

## **The different states of a file in your working copy**

**Any file in your working copy is either:**

- *Tracked* when Git knows about it, either because it’s in the last snapshot or because it has been staged.
- *Untracked* when Git does not know about it, which means it’s neither in the previous snapshot nor staged.

**Tracked files can be:**

- *Unmodified*: a tracked file that has no changes in your working copy.
- *Modified*: a tracked file that has changed in your working copy.
- *Deleted:* a tracked file that no longer exists in your working copy.

While Git’s manual talks about files, it’s better to think about changes. The same file can have three different versions, one for each area of Git:

- A version stored in the last snapshot.
- A modified version in the staging area.
- A modified version in the working copy with some more changes that are not staged yet.

[Git-for-iOS-Development-2.1-Creating-Snapshots-of-your-Work-Slides.pdf](Git%20-%20iOS%20Foundations%201b27d17ecdf98097a50dcd78588c135b/Git-for-iOS-Development-2.1-Creating-Snapshots-of-your-Work-Slides.pdf)

## **Tracking the status of modified files in your working copy**

<aside>
💡

- A: added (new and staged file).
- M: modified (committed file with changes in the working copy).
- R: removed (committed file deleted from the working copy).
- ?: untracked (new but unstaged file).
</aside>

<aside>
💡

Both `git reset --hard` and `git restore --staged` are used to manipulate your Git working directory and staging area, but they serve different purposes. Here's how they work:

### 1️⃣ `git reset --hard <commit>`

- **Effect:** Moves the branch pointer (HEAD) to a previous commit and discards all changes (both in the working directory and staging area).
- **Usage:**
    
    ```bash
    sh
    CopyEdit
    git reset --hard HEAD~1  # Resets to the previous commit, losing all changes
    git reset --hard <commit-hash>  # Resets to a specific commit
    ```
    
- **Warning:** This permanently removes uncommitted changes and staged files. Use with caution!

---

### 2️⃣ `git restore --staged <file>`

- **Effect:** Unstages a file (removes it from the staging area) but **keeps changes in the working directory**.
- **Usage:**
    
    ```bash
    sh
    CopyEdit
    git restore --staged file.txt  # Removes file.txt from staging but keeps modifications
    git restore --staged .  # Unstages all files
    ```
    
- **Alternative:**
    
    ```bash
    sh
    CopyEdit
    git reset HEAD <file>  # Older way to unstage a file
    ```
    

### 🔥 Key Difference:

- `git reset --hard` **discards** changes completely.
- `git restore --staged` **only unstages** files but keeps changes in the working directory.

Let me know if you need an example! 🚀

</aside>

## **Conventional Commits**

<aside>
💡

[https://www.conventionalcommits.org/en/v1.0.0/#specificatio](https://www.conventionalcommits.org/en/v1.0.0/#specification)

</aside>

![Screenshot 2025-03-11 at 10.36.38 PM.png](Git%20-%20iOS%20Foundations%201b27d17ecdf98097a50dcd78588c135b/Screenshot_2025-03-11_at_10.36.38_PM.png)

![Screenshot 2025-03-11 at 10.38.11 PM.png](Git%20-%20iOS%20Foundations%201b27d17ecdf98097a50dcd78588c135b/Screenshot_2025-03-11_at_10.38.11_PM.png)

[Git-for-iOS-Development-2.3-Atomic-Commits-Slides.pdf](Git%20-%20iOS%20Foundations%201b27d17ecdf98097a50dcd78588c135b/Git-for-iOS-Development-2.3-Atomic-Commits-Slides.pdf)

Here is a list of conventional commit types:

- `FEAT`: The commit adds a new feature to the product.
- `CHANGE`: The commit changes the implementation of an existing feature.
- `REMOVE`: The commit removes a feature from the product. Typically, features are deprecated first before being removed.
- `FIX`: The commit fixes a bug in the product.
- `REFACTOR`: The commit refactors or restructures existing code in the product but does not change its behavior.
- `DEPRECATE`: The commit deprecates existing functionality but does not remove it from the product. For example, older APIs may get deprecated because newer, more efficient APIs are available. Removing them could break existing code. So, developers will be given time to migrate to the newer APIs before the older ones are removed.
- `PERF`: The commit improves the performance of algorithms, memory usage, network bandwidth, or battery consumption. It does not change any existing feature.
- `SECURITY`: The commit improves the security of the product or resolves a security issue that has been reported.
- `STYLE`: The commit updates or reformats the style of the source code but doesn’t change its meaning. For example, white space, formatting, new lines, brackets, line length, etc. This is often done using a linter.
- `TEST`: The commit adds new tests to the suite of automated tests for the project. Or it fixes existing tests broken by a change in the code.
- `DOCS`: The commit adds, updates, or revises documentation.
- `BUILD`: The commit changes the build configuration of the product, the project version or adds, removes, or updates external dependencies.
- `CI`: The commit changes continuous integration scripts or configuration files.
- `OPS`: The commit affects operational components like infrastructure, deployment, backup, or recovery.
- `CHORE`: The commit includes a task necessary for managing the product but is not tied to any specific feature. For example, releasing the product, regenerating generated code, or modifying the .gitignore file.
- `REVERT`: The commit reverts one or more commits that were accidentally merged or caused severe issues and required removal from the master branch.

## **Storing secrets in configuration file**

[https://iosfoundations.com/lesson/git-for-ios-development-lesson-2-4/](https://iosfoundations.com/lesson/git-for-ios-development-lesson-2-4/)

<aside>
💡

let me reiterate that you should never change any commit that has been shared with other developers.

That means it is even more critical that you carefully craft each commit on your machine before you push it to a shared repository accessed by others.

</aside>

## Amend

Luckily, Git allows us to *amend* the last commit. The amending commit action is often used to fix minor mistakes. The most common mistakes are:

- A wrong commit message.
- Missing files or changes.

```bash
#amend commit
git commit --amend
#last commit log
git log -1 --stat
#get HEAD pointer logs
git reflog
```

![image.png](Git%20-%20iOS%20Foundations%201b27d17ecdf98097a50dcd78588c135b/image.png)

## Reset

A reset “removes” commits from the history of our repository while (optionally) preserving all changes in our working directory. We can then re-commit our working directory into one or more snapshots.

<aside>
💡

Use --soft or --mixed to preserve changes from the previous commit

</aside>

```bash
git reset --soft 1ce70ee
git reset --hard 1ce70ee
git reset --mixed 1ce70ee
```

- A `-soft` reset keeps your working directory and staging area untouched. All the changes in the removed commits will stay in your working copy and be staged.
- A `-mixed` reset updates the staging area to the content of the commit to which the *HEAD* reference now points to. In practice, all changes are still in your working copy, but they are all unstaged. This is the most common reset and the default one when you do not specify any parameters.
- A `-hard` reset updates both the staging area and the working copy to the content of the commit to which the *HEAD* reference now points to. This has the effect of discarding all changes from your working copy.

![image.png](Git%20-%20iOS%20Foundations%201b27d17ecdf98097a50dcd78588c135b/image%201.png)

![image.png](Git%20-%20iOS%20Foundations%201b27d17ecdf98097a50dcd78588c135b/image%202.png)

## **Understanding the contents of the Xcode project file**

<aside>
💡

VS Code extension for syntax heilight of xcode project file

[https://marketplace.visualstudio.com/items?itemName=mariomatheu.syntax-project-pbxproj](https://marketplace.visualstudio.com/items?itemName=mariomatheu.syntax-project-pbxproj)

</aside>

# **The format of the Xcode project file**

Basically, an Xcode project file is composed of arrays, dictionaries, and strings.

Here are the syntax rules, copied from the Wikipedia article I linked above in case they disappear:

- **Strings** are represented in C literal style: “This is a plist string\n”; simpler, unquoted strings are allowed as long as they consist of alphanumerics and one of _$+/:.-.
- **Binary data** are represented as: < [hexadecimal codes in ASCII] >. Spaces and comments between paired hex codes are ignored.
- **Arrays** are represented as: ( “1”, “2”, “3” ). Trailing commas are tolerated.
- **Dictionaries** are represented as: { “key” = “value”; … }. The left-hand side must be a string, but it can be unquoted.
- **Comments** are allowed as: /* This is a comment */ and // This is a line comment.
- As in C, **whitespace** is generally insignificant to syntax. Value statements terminate by a semicolon.

<aside>
📌

Complete XCode project details [http://www.monobjc.net/xcode-project-file-format.html](http://www.monobjc.net/xcode-project-file-format.html)

</aside>

While it’s not hard to learn how a project file is structured, here are the most important things to notice.

- Objects are referenced by their ID, e.g., `95120B7528AFCF1F003E54FB`.

These identifiers look very similar to each other due to the way that Xcode generates them. But luckily, every line is annotated with comments explaining what these identifiers reference.

- The file has a root dictionary with a huge `object` dictionary wrapping the whole content of the file.

The `objects` dictionary is conveniently divided into sections using comments, i.e., `/* Begin PBXBuildFile section */`, but such comments do not matter. All objects are part of the same dictionary.

Objects are also dictionaries. What determines their grouping is their type, expressed by their `isa` property. For example, all the entries belonging to the *PBXBuildFile* section contain `isa = PBXBuildFile`.

## Rebase

Simply defined, the `git rebase` command reapplies a series of commits on top of another. Using the interactive option of rebasing, you can replay a range of commits in your history and change some of them.

After any change, Git will reapply all the remaining commits on top of that change. This will create a new timeline that contains the latest changes.

Rebasing, therefore, enables another commit workflow that you can adapt to the way you write code.

With rebasing in your toolbox, you can create commits as you progress, as we saw in the reset workflow. But this time, you can create atomic commits immediately whenever you have the chance.

Then, instead of resetting all commits and painstakingly recreating each one, you only need to fix the bad ones without redoing the good ones.

Rebasing is another one of those Git actions that change the history of your repository, so all that I said previously still applies:

- No commit is ever lost when rebasing. If you mess up a rebase, you can always find old commits using the reflog.
- Never rebase commits you have shared with other developers.

When you rebase, you have to specify the hash of the first commit that will be **excluded** from your rebase. Here, it will be the initial commit, so we must use the hash of that commit, i.e., `git rebase -i 0ce7f60`.

![image.png](Git%20-%20iOS%20Foundations%201b27d17ecdf98097a50dcd78588c135b/image%203.png)