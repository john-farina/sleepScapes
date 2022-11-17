import React, { useRef } from "react";

export default function Sleep(users, signedIn) {
  const allUsers = useRef(users.users);
  console.log(signedIn);
  return (
    <div className="sleepContainer">
      {allUsers.current.map((item, iteration) => {
        return (
          <h2 key={iteration}>
            {item.email} - {item.name}
          </h2>
        );
      })}
    </div>
  );
}
