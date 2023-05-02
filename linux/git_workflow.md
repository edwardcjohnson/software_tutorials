1. Create new feature branch <br>
`git checkout -b <branch name>`

2. Run before any edits to get baseline functionality e.g. <br>
`kedro run --pipeline <pipeline name> --to-nodes <node name>`

3. edit pipeline

4. test pipeline

5. push updates to new remote branch <br>
`git push -u origin <branch name>`

6. Submit PR

7. Have PR Reviewed/Approved and Merged in development

8. Pull updates and delete local feature branch <br>
`git checkout development` <br>
`git pull` <br>
`git branch -d <branch name>` <br>
