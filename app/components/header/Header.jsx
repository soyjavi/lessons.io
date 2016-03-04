import React from 'react';
import { Link } from 'react-router';
// -- Context
import style from './style.scss';

const Header = props => {
  return (
    <header className={style.root}>
      <a href='/' className={style.brand}>
        <img className={style.logo} src='/img/logo.png'/>
        <h4 className={style.title}>hackvolt</h4>
      </a>
      <nav className={style.menu}>
        <Link to='/series'>Series</Link>
        <Link to='/roadmap'>Roadmap</Link>
        <Link to='/about'>Nosotros</Link>
      </nav>
      <nav className={style.session}>
        <Link to='/sign_in'>Login</Link>
      </nav>
    </header>
  );
};

Header.propTypes = {
  session: React.PropTypes.object
};

Header.defaultProps = {
  object: undefined
};

export default Header;
