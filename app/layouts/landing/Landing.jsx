import React from 'react';
import { Link } from 'react-router';
// -- Components
import Particles from '../../components/particles'
// -- Context
import style from './style.scss';
import C from '../../constants'

const Landing = props => {
  return (
    <section data-component-layout='finder' className={style.root}>
      <div className={style.wrapper}>
        <h2 className={style.title}>{C.SITE.TITLE}</h2>
        <h4 className={style.description}>{C.SITE.DESCRIPTION}</h4>

        <Link to='/join' className={style.button}>
          <strong>Unlock the knowledge</strong>
          <small>click here to level up</small>
        </Link>
      </div>
      <Particles />
    </section>
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
