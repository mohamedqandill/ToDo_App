import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/UI/core/models/firebase_models.dart';
import 'package:todo_app/UI/core/models/user_models.dart';

class FirebaseFunctions {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  // static Color color=Colors.blue;

  static CollectionReference<TaskModel> mainTasksFunction() {
    return firestore.collection("Tasks").withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static CollectionReference<UserModel> mainUsersFunction() {
    return firestore.collection("Users").withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static Future<void> addUsers(UserModel user)async{
    var ref=mainUsersFunction();
    await ref.doc(user.id).set(user);

  }
  static Future<UserModel?> getUser()async{
    String user=FirebaseAuth.instance.currentUser?.uid??"";
    var ref=mainUsersFunction();
    var docRef= await ref.doc(user).get();
    return docRef.data();
  }

  static Future<void> addTask(TaskModel task) {
    var collection = mainTasksFunction();
    var docref = collection.doc();
    task.id = docref.id;
    task.userId = FirebaseAuth.instance.currentUser?.uid ?? "";
    return docref.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime dateTime) {
    String user = FirebaseAuth.instance.currentUser?.uid ?? "";
    var collection = mainTasksFunction();
    return collection
        .where("date",
            isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch).where("userId",isEqualTo: user)
        .snapshots();
  }

  static void deleteTask(String id) {
    var collection = mainTasksFunction();
    collection.doc(id).delete();
  }

  static Future<void> editTaskDetails(TaskModel task) {
    var collection = mainTasksFunction();
    return collection.doc(task.id).update({
      'title': task.title,
      'desc': task.desc,
      'time': task.time
      // 'dateTime': task.time!.millisecondsSinceEpoch,
    });
  }

  static void isDone(TaskModel task) {
    var collection = mainTasksFunction();
    task.isDone = !task.isDone;
    collection.doc(task.id).update(task.toJson());
  }

  static createAccount(String email, String Password,String phone,String name) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: Password,
      );
      credential.user!.sendEmailVerification();
      addUsers(UserModel(id: credential.user?.uid??"", email: email, phone: phone, name: name));
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {

      }
      throw e.toString();
    } catch (e) {
      throw e;
    }

  }

  static Future<UserCredential> Login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw e.toString();
    }
  }

 static void resetPassword(String email){
    FirebaseAuth.instance.sendPasswordResetEmail(email:email );
  }


}
