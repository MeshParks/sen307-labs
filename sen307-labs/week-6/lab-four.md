# Lab 4 Notes: Referential Integrity

**Name:** Eribo Nateinmibebi Franklin  
**Matric:** 12416

In Part 4 I got **Error 1451: Cannot delete or update a parent row: a foreign key constraint fails** when I tried to delete the department "Library and Information Science". MySQL refuses because the Student table has a row (Transfer Student) whose `dept_id` still points to that department. Deleting the department would leave that student pointing at a department that no longer exists, so the foreign key protects referential integrity.

I fixed it by first reassigning the student to another department with `UPDATE`, which meant no student depended on the department any more. After that the `DELETE` succeeded and the student was moved rather than lost.

Another fix would have been to define the foreign key with `ON DELETE CASCADE`, which deletes the dependent students automatically, or `ON DELETE SET NULL`, which keeps the students but clears their department. I used the manual fix because it keeps the student's record.