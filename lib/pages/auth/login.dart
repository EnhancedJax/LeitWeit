import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:LeitWeit/services/supabase.dart';
import 'package:LeitWeit/pages/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  static const route = '/auth/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              label: Text('Email'),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              label: Text('Password'),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              try {
                setState(() {
                  _isLoading = true;
                });
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();
                await supabase.auth.signUp(
                  email: email,
                  password: password,
                );
                await supabase.auth.refreshSession();
                if (mounted) {
                  context.push(HomePage.route);
                }
              } on AuthException catch (error) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(error.message)));
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Unexpected error occurred')));
              }
              if (mounted) {
                setState(() {
                  _isLoading = false;
                });
              }
            },
            child: _isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: Center(
                        child: CircularProgressIndicator(color: Colors.white)),
                  )
                : const Text('Register'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();
                await supabase.auth.signInWithPassword(
                  email: email,
                  password: password,
                );
                await supabase.auth.refreshSession();
                if (mounted) {
                  context.push(HomePage.route);
                }
              } on AuthException catch (error) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(error.message)));
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Unexpected error occurred')));
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
