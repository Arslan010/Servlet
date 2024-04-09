package edu.jspemptaskmanag.view;

import java.time.LocalDate;
import java.util.List;
import java.util.Scanner;

import edu.jspemptaskmanag.controller.Controller;
import edu.jspemptaskmanag.model.Employee;
import edu.jspemptaskmanag.model.Task;
import edu.jspemptaskmanag.model.TaskManagerException;

public class View {

    private Controller controller;
    private Scanner scanner;

    public View() {
        controller = new Controller();
        scanner = new Scanner(System.in);
    }

    public void start() {
        int choice;
        do {
            displayMenu();
            choice = scanner.nextInt();
            processChoice(choice);
        } while (choice != 0);
    }

    private void displayMenu() {
        System.out.println("1. Add Employee");
        System.out.println("2. Remove Employee");
        System.out.println("3. Search Employee");
        System.out.println("4. Get All Employees");
        System.out.println("5. Add Task");
        System.out.println("6. Remove Task");
        System.out.println("7. Search Task");
        System.out.println("8. Get All Tasks");
        System.out.println("9. Assign Task");
        System.out.println("0. Exit");
        System.out.print("Enter your choice: ");
    }

    private void processChoice(int choice) {
        switch (choice) {
            case 1:
                addEmployee();
                break;
            case 2:
                removeEmployee();
                break;
            case 3:
                searchEmployee();
                break;
            case 4:
                getAllEmployees();
                break;
            case 5:
                addTask();
                break;
            case 6:
                removeTask();
                break;
            case 7:
                searchTask();
                break;
            case 8:
                getAllTasks();
                break;
            case 9:
                assignTask();
                break;
        }
    }

    private void getAllTasks() {
        try {
            List<Task> tasks = controller.getAllTask();
            displayTaskDetails(tasks);
        } catch (TaskManagerException e) {
            handleException(e);
        }
    }

    private void assignTask() {
        try {
            System.out.print("Enter employee ID: ");
            int empId = scanner.nextInt();
            System.out.print("Enter task ID: ");
            int taskId = scanner.nextInt();
            Task assignedTask = controller.assignTask(empId, taskId);
            System.out.println("Task assigned to employee: " + assignedTask.getName());
        } catch (TaskManagerException e) {
            handleException(e);
        }
    }

    private void searchTask() {
        try {
            System.out.print("Enter task ID to search: ");
            int id = scanner.nextInt();
            Task task = controller.searchTask(id);
            displayTaskDetails(task);
        } catch (TaskManagerException e) {
            handleException(e);
        }
    }

    private void removeTask() {
        try {
            System.out.print("Enter task ID to remove: ");
            int id = scanner.nextInt();
            Task removedTask = controller.removeTask(id);
            System.out.println("Task removed: " + removedTask.getName());
        } catch (TaskManagerException e) {
            handleException(e);
        }
    }

    private void addTask() {
        try {
            Task task = new Task();
            scanner.nextLine(); // Consume the newline character
            System.out.print("Enter task name: ");
            task.setName(scanner.nextLine());
            System.out.print("Enter task deadline (yyyy-MM-dd): ");
            String dateInput = scanner.nextLine();
            task.setDeadLine(LocalDate.parse(dateInput));
            controller.saveTask(task);
            System.out.println("Task added successfully!");
        } catch (TaskManagerException | IllegalArgumentException e) {
            handleException(e);
        }
    }

    private void getAllEmployees() {
        try {
            List<Employee> employees = controller.getAllEmployee();
            displayEmployeeDetails(employees);
        } catch (TaskManagerException e) {
            handleException(e);
        }
    }

    private void searchEmployee() {
        try {
            System.out.print("Enter employee ID to search: ");
            int id = scanner.nextInt();
            Employee searchEmployee = controller.searchEmployee(id);
            displayEmployeeDetails(searchEmployee);
        } catch (TaskManagerException e) {
            handleException(e);
        }
    }

    private void removeEmployee() {
        try {
            System.out.print("Enter employee ID to remove: ");
            int id = scanner.nextInt();
            Employee removedEmployee = controller.removeEmployee(id);
            System.out.println("Employee removed: " + removedEmployee.getName());
        } catch (TaskManagerException e) {
            handleException(e);
        }
    }

    private void addEmployee() {
        try {
            Employee employee = new Employee();
            System.out.println("Enter employee name: ");
            employee.setName(scanner.next());
            System.out.print("Enter employee age: ");
            employee.setAge(scanner.nextInt());
            System.out.print("Enter employee salary: ");
            employee.setSalary(scanner.nextDouble());
            controller.saveEmployee(employee);
        } catch (TaskManagerException | IllegalArgumentException e) {
            handleException(e);
        }
    }

    private void displayEmployeeDetails(List<Employee> employees) {
        for (Employee employee : employees) {
            displayEmployeeDetails(employee);
        }
    }

    private void displayEmployeeDetails(Employee employee) {
        System.out.println();
        System.out.println("*******Employee id: " + employee.getId() + " Detail********");
        System.out.println("Employee Id:"+employee.getId());
        System.out.println("Employee Name:"+employee.getName());
        System.out.println("Employee Age:"+employee.getAge());
        System.out.println("Employee Salary"+employee.getSalary());
        System.out.println("Employee DateOfJoin"+employee.getDateOfJoin());
        displayTaskDetails(employee.getTasks());
        System.out.println();
    }

    private void displayTaskDetails(List<Task> tasks) {
        for (Task task : tasks) {
            displayTaskDetails(task);
        }
    }

    private void displayTaskDetails(Task task) {
        System.out.println("Task id :" + task.getId());
        System.out.println("Task name :" + task.getName());
        System.out.println("Task StartDate :" + task.getStartDate());
        System.out.println("Task DeadLine Date :" + task.getDeadLine());
        List<Employee> employees = task.getEmployees();
        if (employees != null && !employees.isEmpty()) {
            System.out.print("Task Employees Names: ");
            for (Employee employee : employees) {
                System.out.print(employee.getName() + ", ");
            }
            System.out.println();
        } else {
            System.out.println("No employees assigned to this task.");
        }
    }

    private void handleException(Exception e) {
        System.out.println("Error: " + e.getMessage());
    }

    public static void main(String[] args) {
        View view = new View();
        view.start();
    }
}
