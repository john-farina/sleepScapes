import React from "react";
import SignedInHeader from "./headers/SignedInHeader";
import SignedOutHeader from "./headers/SignedOutHeader";

export default function Header(signedIn) {
  if (signedIn.signedIn) {
    return <SignedOutHeader />;
  } else {
    return <SignedOutHeader />;
  }
}
