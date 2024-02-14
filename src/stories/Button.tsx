import React, { useState } from 'react';
import './button.css';

interface ButtonProps {
  /**
   * Is this the principal call to action on the page?
   */
  primary?: boolean;
  /**
   * What background color to use
   */
  backgroundColor?: string;
  /**
   * How large should the button be?
   */
  size?: 'small' | 'medium' | 'large';
  /**
   * Button contents
   */
  label: string;
  /**
   * Optional click handler
   */
  classString? : number;
  onClick?: () => void;
}

/**
 * Primary UI component for user interaction
 */
export const Button = ({
  primary = false,
  size = 'medium',
  backgroundColor,
  label,
  classString,
  ...props
}: ButtonProps) => {
  const mode = primary ? 'storybook-button--primary' : 'storybook-button--secondary';
  const [classStr, setClassStr] = useState('')
  const handleClick = () => {
    let randomNumber = Math.random();
    let classString =`bg-red-${randomNumber >= 0.5 ? '200' : '600'}`
    setClassStr(classString);
  }
  return (
    <button
      type="button"
      className={['storybook-button', `storybook-button--${size}`, mode,classStr].join(' ')}
      style={{ backgroundColor }}
      {...props}
      onClick={handleClick}
    >
      {label}
    </button>
  );
};
