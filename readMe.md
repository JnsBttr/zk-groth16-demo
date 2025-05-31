Contract Adress: 0xb75F96485E0765527de836e4e0B461a3C161B292
## Compile circuit
circom Multiplier.circom --r1cs --wasm --sym --c
-> Create input.json
Witness generation with Webassembly :
node generate_witness.js Multiplier.wasm input.json witness.wtns

--- can also be done with C++ but you need to install libraries

## Powers of Tau
npx snarkjs powersoftau new bn128 12 pot12_0000.ptau -v

npx snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v

snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v

npx snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v

## Groth16 Proof Generation
npx snarkjs groth16 setup Multiplier.r1cs pot12_final.ptau Multiplier_0000.zkey
npx snarkjs zkey contribute Multiplier_0000.zkey Multiplier_0001.zkey --name="1st Contributor Name" -v
npx snarkjs zkey export verificationkey Multiplier_0001.zkey verification_key.json
npx snarkjs groth16 prove Multiplier_0001.zkey witness.wtns proof.json public.json
npx snarkjs groth16 verify verification_key.json public.json proof.json
npx snarkjs zkey export solidityverifier Multiplier_0001.zkey verifier.sol
npx snarkjs generatecall