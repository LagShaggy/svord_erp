<script lang="ts">
	export let size: number = 200
</script>

<svg width={size} height={size} viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg">
	<g id="logo">
		<path
			id="blade1"
			class="fill-primary-colour stroke-primary-colour stroke-8"
			fill-rule="evenodd"
			clip-rule="evenodd"
			d="M48 225.977C51.9029 113.244 141.402 22.2598 253.521 16C231.063 22.4919 211.65 34.6839 195.282 52.576C179.658 69.6541 170.039 86.9041 166.426 104.326C163.091 121.443 163.552 138.391 167.809 155.17C172.345 171.644 179.064 187.875 187.967 203.862C197.174 220.129 206.927 235.493 217.225 249.956C227.827 264.697 237.21 278.323 245.373 290.832C253.536 303.342 259.019 314.801 261.822 325.208C264.625 335.616 262.679 344.479 255.983 351.798C251.24 356.983 245.225 359.883 237.939 360.5C231.236 361.09 222.957 359.118 213.101 354.583C203.523 349.743 192.483 341.603 179.979 330.164C161.376 313.145 145.271 293.09 131.664 269.998C118.641 246.879 109.148 224.189 103.185 201.928L48 225.977Z"
		/>
		<path
			class="fill-primary-colour stroke-primary-colour stroke-8"
			id="blade2"
			fill-rule="evenodd"
			clip-rule="evenodd"
			d="M471.702 239.447C473.602 352.231 388.901 447.698 277.252 459.716C299.346 452.077 318.106 438.903 333.533 420.193C348.258 402.334 356.977 384.612 359.69 367.027C362.14 349.762 360.807 332.86 355.693 316.322C350.316 300.103 342.771 284.239 333.058 268.731C323.026 252.959 312.496 238.117 301.468 224.203C290.121 210.026 280.05 196.901 271.255 184.828C262.46 172.754 256.394 161.593 253.06 151.344C249.725 141.094 251.213 132.142 257.523 124.488C261.993 119.067 267.851 115.861 275.096 114.87C281.76 113.936 290.129 115.48 300.206 119.502C310.019 123.843 321.464 131.404 334.539 142.185C353.993 158.224 371.108 177.425 385.884 199.787C400.079 222.205 410.727 244.377 417.827 266.302L471.702 239.447Z"
		/>
	</g>
</svg>

<style>
	#blade1,
	#blade2 {
		transition: all 0.3s ease-in;
	}

	svg #blade1 {
		animation-name: moveLeft;
		animation-duration: 0.5s;
		animation-fill-mode: forwards;
		animation-iteration-count: 1;
	}

	svg #blade2 {
		animation-name: moveRight;
		animation-duration: 0.5s;
		animation-fill-mode: forwards;
		animation-iteration-count: 1;
	}

	svg {
		animation-name: loadingSpin;
		animation-duration: 1s;
		animation-delay: 0.2s;
		animation-iteration-count: infinite;
		transform-origin: center;
	}

	@keyframes moveRight {
		from {
			transform: translateX(0);
		}
		to {
			transform: translateX(20px);
		}
		/* 100% {
			transform: translateX(0);
		} */
	}

	@keyframes moveLeft {
		from {
			transform: translateX(0);
		}
		to {
			transform: translateX(-20px);
		}
	}

	@keyframes loadingSpin {
		from {
			transform: rotate(0);
		}
		to {
			transform: rotate(2turn);
		}
	}
</style>
