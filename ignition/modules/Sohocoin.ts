import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("SohocoinModule", (m) => {
  const soho = m.contract("Sohocoin");

  m.call(soho, "name");

  return { soho };
});
