
package edu.jspemptaskmanag.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import edu.jspemptaskmanag.model.Employee;
import edu.jspemptaskmanag.model.Task;
import edu.jspemptaskmanag.model.TaskManagerException;

public class Controller {

    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Taskmanager");
    EntityManager entityManager = entityManagerFactory.createEntityManager();
    EntityTransaction entityTransaction = entityManager.getTransaction();

    // saveEmployee
    public Employee saveEmployee(Employee employee) {
        try {
            entityTransaction.begin();
            entityManager.persist(employee);
            entityTransaction.commit();
            return employee;
        } catch (Exception e ) {
            rollbackTransaction();
            throw new TaskManagerException("Error while saving employee."+ e);
        }
    }
    
    public Employee saveValue(int id)
    {
    	Employee updatedEmployee = entityManager.find(Employee.class, id);
    	Employee existingEmployee = new Employee(); 
    	if (existingEmployee != null) {
            existingEmployee.setName(updatedEmployee.getName());
            existingEmployee.setAge(updatedEmployee.getAge());
            existingEmployee.setSalary(updatedEmployee.getSalary());
            
        }
    	return existingEmployee;
    	
    }
    
    public Task saveTaskValue(int id)
    {
    	Task task=entityManager.find(Task.class, id);
    	Task task2 =new Task();
    	if(task2!=null)
    	{
    		task2.setName(task.getName());
    		task2.setDeadLine(task.getDeadLine());
    	}
    	return task2;
    }
    
 // UpdateEmployee
    public Employee updateEmployee(Employee updatedEmployee ,int id) {
        try {
            entityTransaction.begin();
            Employee existingEmployee = entityManager.find(Employee.class, id);
            if (existingEmployee != null) {
                existingEmployee.setName(updatedEmployee.getName());
                existingEmployee.setAge(updatedEmployee.getAge());
                existingEmployee.setSalary(updatedEmployee.getSalary());
                
            }
            entityTransaction.commit();
            return existingEmployee;
        } catch (Exception e) {
            throw new TaskManagerException("Error while updating employee." + e);
        }
    }

    // UpdateTask
    public Task updateTask(Task updatedTask, int id) {
        try {
            entityTransaction.begin();
            Task existingTask = entityManager.find(Task.class, id);
            if (existingTask != null) {
                existingTask.setName(updatedTask.getName());
                existingTask.setDeadLine(updatedTask.getDeadLine());
                entityManager.merge(existingTask);
            }
            entityTransaction.commit();
            return existingTask;
        } catch (Exception e) {
            rollbackTransaction();
            throw new TaskManagerException("Error while updating task." + e);
        }
    }


    // removeEmployee
    public Employee removeEmployee(int id) {
        try {
            entityTransaction.begin();
            Employee employee = entityManager.find(Employee.class, id);

            if (employee != null) {
                List<Task> tasks = employee.getTasks();
                for (Task task : tasks) {
                    task.getEmployees().remove(employee);
                }
                employee.getTasks().clear();
                entityManager.merge(employee);
                entityManager.remove(employee);
            }
            	
            entityTransaction.commit();
            return employee;
        } catch (Exception e) {
            rollbackTransaction();
            throw new TaskManagerException("Error while removing employee."+ e);
        }
    }

    // searchEmployee
    public Employee searchEmployee(int id) {
        try {
            Employee employee = entityManager.find(Employee.class, id);
            return employee;
        } catch (Exception e) {
            throw new TaskManagerException("Error while searching for employee."+ e);
        }
    }

    // getAllEmployee
    public List<Employee> getAllEmployee() {
        try {
            String sql = "SELECT e FROM Employee e";
            Query query = entityManager.createQuery(sql);
            List<Employee> employees = query.getResultList();
            if (employees.isEmpty()) {
                throw new TaskManagerException("No employees found.");
            }
            return employees;
        } catch (Exception e) {
            throw new TaskManagerException("Error while getting all employees."+ e);
        }
    }

    //UpdateEmployee
    public Employee updateEmployee(int id)
    {
    	
    	Employee employee= entityManager.find(Employee.class, id);
		return null;
    	
    }
    
    
    // saveTask
    public Task saveTask(Task task) {
        try {
            entityTransaction.begin();
            entityManager.persist(task);
            entityTransaction.commit();
            return task;
        } catch (Exception e) {
            rollbackTransaction();
            throw new TaskManagerException("Error while saving task."+ e);
        }
    }

    // removeTask
    public Task removeTask(int id) {
        try {
            entityTransaction.begin();
            Task task = entityManager.find(Task.class, id);
            if (task != null) {
                List<Employee> employees = task.getEmployees();
                for (Employee employee : employees) {
                    employee.getTasks().remove(task);
                }
                task.getEmployees().clear();
                entityManager.merge(task);
                entityManager.remove(task);
            }
            entityTransaction.commit();
            return task;
        } catch (Exception e) {
            rollbackTransaction();
            throw new TaskManagerException("Error while removing task."+ e);
        }
    }

    // searchTask
    public Task searchTask(int id) {
        try {
            Task task = entityManager.find(Task.class, id);
            return task;
        } catch (Exception e) {
            throw new TaskManagerException("Error while searching for task."+ e);
        }
    }

    // getAllTask
    public List<Task> getAllTask() {
        try {
            String sql = "SELECT e FROM Task e";
            Query query = entityManager.createQuery(sql);
            List<Task> tasks = query.getResultList();
            if (tasks.isEmpty()) {
                throw new TaskManagerException("No tasks found.");
            }
            return tasks;
        } catch (Exception e) {
            throw new TaskManagerException("Error while getting all tasks."+ e);
        }
    }

    // getAssignTask
    public Task assignTask(int emp_Id, int task_Id) {
        try {
            entityTransaction.begin();
            Employee employee = entityManager.find(Employee.class, emp_Id);
            Task task = entityManager.find(Task.class, task_Id);
            if (employee != null && task != null) {
                employee.getTasks().add(task);
                task.getEmployees().add(employee);
            }
            entityManager.persist(employee);
            entityManager.persist(task);
            entityTransaction.commit();
            return task;
        } catch (Exception e) {
            rollbackTransaction();
            throw new TaskManagerException("Error while assigning task."+ e);
        }
    }

    // getTasksByEmployeeId
    public List<Task> getTasksByEmployeeId(int employeeId) {
        try {
            Employee employee = entityManager.find(Employee.class, employeeId);
            if (employee != null) {
                return employee.getTasks();
            } else {
                throw new TaskManagerException("Employee with ID " + employeeId + " not found.");
            }
        } catch (Exception e) {
            throw new TaskManagerException("Error while getting tasks for employee with ID " + employeeId + ": " + e.getMessage());
        }
    }

    private EntityTransaction rollbackTransaction() {
        if (entityTransaction.isActive()) {
            entityTransaction.rollback();
            return entityTransaction;
        }
        else
        	return entityTransaction;
    }
}
