////
////  CoreDataManager.swift
////  plaant
////
////  Created by Rahaf on 28/10/2024.
////
//
//import CoreData
//
//@MainActor
//class CoreDataManager: ObservableObject {
//    @Published var reminders: [PplantReminder] = []{
//    static let shared = CoreDataManager()
//
//    private let persistentContainer: NSPersistentContainer
//
//    private init() {
//        persistentContainer = NSPersistentContainer(name: "PlantReminderModel")
//        loadPersistenceStores()
//    }
//
//    func loadPersistenceStores() {
//        persistentContainer.loadPersistentStores { (error) in
//            if let error = error {
//                fatalError("Core Data store load failed: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    func saveContext() {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
//
//    func fetchReminders() -> [PplantReminder] {
//        let fetchRequest: NSFetchRequest<PplantReminder> = PlantReminder.fetchRequest()
//        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)] // Sort reminders alphabetically
//
//        do {
//            let reminders = try persistentContainer.viewContext.fetch(fetchRequest)
//            return reminders
//        } catch {
//            fatalError("Failed to fetch reminders: \(error.localizedDescription)")
//        }
//    }
//
//    func addReminder(_ reminder: PplantReminder) {
//        let context = persistentContainer.viewContext
//        let newReminder = PplantReminder(context: context)
//        newReminder.name = reminder.name
//        newReminder.room = reminder.room
//        newReminder.light = reminder.light
//        newReminder.wateringDays = reminder.wateringDays
//        newReminder.waterAmount = reminder.waterAmount
//        saveContext()
//    }
//
//    func updateReminder(_ reminder: PplantReminder) {
//        let context = persistentContainer.viewContext
//        let existingReminder = context.object(with: reminder.id) as! PlantReminder
//        existingReminder.name = reminder.name
//        existingReminder.room = reminder.room
//        existingReminder.light = reminder.light
//        existingReminder.wateringDays = reminder.wateringDays
//        existingReminder.waterAmount = reminder.waterAmount
//        saveContext()
//    }
//
//    func deleteReminder(_ reminder: PplantReminder) {
//        let context = persistentContainer.viewContext
//        context.delete(reminder)
//        saveContext()
//    }
//}
