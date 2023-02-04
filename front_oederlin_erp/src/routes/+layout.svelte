<script>
	import '../app.css'
	import {
		Navbar,
		NavBrand,
		NavLi,
		NavUl,
		NavHamburger,
		Dropdown,
		DropdownItem,
		Chevron
	} from 'flowbite-svelte'
</script>

<Navbar let:hidden let:toggle>
	<NavBrand href="/">
		<img
			src="/favicon.png"
			class="mr-3 h-6 sm:h-9"
			alt="SwimSuit"
		/>
		<span
			class=" font-body self-center whitespace-nowrap text-xl font-semibold dark:text-white"
		>
			Œderlin
		</span>
	</NavBrand>
	<NavHamburger on:click={toggle} />
	<NavUl {hidden}>
		<NavLi href="/" active={true}>Home</NavLi>
		<NavLi id="nav-menu1" class="cursor-pointer"
			><Chevron aligned>Orders</Chevron></NavLi
		>
		<NavLi href="/products">Products</NavLi>
		<NavLi href="/users">Users</NavLi>
		<Dropdown triggeredBy="#nav-menu1" class="z-20 w-44">
			<DropdownItem href="/orders/create"
				>Create</DropdownItem
			>
			<DropdownItem href="/orders/view"
				>View All</DropdownItem
			>
		</Dropdown>
	</NavUl>
</Navbar>

<div class="container mx-auto my-6 max-w-lg font-serif">
	<slot />
</div>

<div class="container mx-auto my-6 max-w-lg">
	<h1>What should be in the Footer?</h1>
</div>

<style>
</style>
