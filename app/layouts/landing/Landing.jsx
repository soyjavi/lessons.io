import React from 'react';
import style from './style.scss';
// -- Components
import Header from '../../components/header'
import Footer from '../../components/footer'

const Landing = props => {
  return (
    <article>
      <Header />
      <div data-component-layout='finder' className={style.root}>
        <div className='wrapper'>
          <h2 className={style.title}>Aprende React</h2>
          <h4>con un video tutorial cada semana.</h4>

          <form>
            <input type='text' />
            <button onClick={Landing.onClick}>Click me</button>
          </form>
          <label>te prometemos que no enviaremos nada de spam</label>
        </div>
      </div>
      <Footer />
    </article>
  );
};

Landing.propTypes = {
  caption: React.PropTypes.string
};

Landing.defaultProps = {
  caption: ''
};

Landing.onClick = function() {
  alert('Hello world')
};

export default Landing;
