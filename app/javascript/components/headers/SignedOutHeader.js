import React from "react";

export default function SignedOutHeader() {
  return (
    <header className="pageHeader signedOutHeader">
      <div className="topBox">
        <div className="profilePic"></div>
      </div>

      <div className="optionColumn first">
        <p>Home</p>
      </div>

      <div className="optionColumn">
        <p>Sign In</p>
      </div>

      <div className="optionColumn">
        <p>Sign Up</p>
      </div>
    </header>
  );
}
