import React from 'react';
import style from './style.scss';

const Subscribe = props => {
  return (
    <div data-component-layout='finder' className={style.root}>
      <h1>Aprende React</h1>
      <small>Screencasts y mucho codigo para aprender la nueva libreria de Facebook.</small>

      <form>
        <input type='text' />
        <button onClick={Subscribe.onClick}>Click me</button>
      </form>
      <label>te prometemos que no enviaremos nada de spam</label>
    </div>
  );
};

Subscribe.propTypes = {
  caption: React.PropTypes.string
};

Subscribe.defaultProps = {
  caption: ''
};

Subscribe.onClick = function() {
  alert('Hello world')
};

export default Subscribe;
