import React from 'react';
import { Link } from 'react-router';
// -- Components
import Button from '../../components/button'
import Input from '../../components/input'
import Form from '../../components/form'
import Title from '../../components/title'
// -- Modules
import Request from '../../modules/request'
// -- Internal
import style from './style.scss';


const SignIn = props => {
  return (
    <section>
      <Title caption='Login to' description='lorem' />
      <Form onChange={SignIn.handleOnChange} onSubmit={SignIn.handleSubmit} className={style.form}>
        <Input ref='mail' placeholder='Email' />
        <Input ref='password' type='password' placeholder='Password' />
        <Button caption='Log In' />
      </Form>
      <Link to='/sign_up'>Sign up</Link>
    </section>
  );
};

export default SignIn;

SignIn.handleSubmit = (event, value) => {
  console.log('::handleSubmit::', value);
  // Request.post('signin', {mail: 's1@lessons.io', password: 's1'}).then((error, value) => {
  //   console.log('????', error, value);
  // });
}

SignIn.handleOnChange = function(value, event) {
  console.log('::_handleOnChange::', value, event);
}
