import React from 'react';
import style from './style.scss';

const Header = props => {
  return (
    <header className={style.root}>
      <img className={style.logo} />
      <nav className={style.menu}>
        <a href='#'>Episodios</a>
        <a href='#'>Roadmap</a>
        <a href='#'>About</a>
      </nav>
      <nav className={style.session}>
        <a href='#'>Login</a>
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
