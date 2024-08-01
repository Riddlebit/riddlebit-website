<script>
  import { onMount } from 'svelte';

  // Navbar data
  const navbarHeight = 60;
  const navItems = [
    { label: 'Home', id: '', href: '/#header' },
    { label: 'About Us', id: 'about', href: '/#about' },
    { label: 'Games', id: 'games', href: '/#games' },
    { label: 'Our Team', id: 'our-team', href: '/#our-team' },
    { label: 'Careers', id: '', href: 'https://thehub.io/startups/riddlebit-software' }
  ];

  let navOpen = false;
  let mobileNav = false;
  let scrollY, isHomepage;
  let currentSection = 'none';

  const toggleNav = () => {
    navOpen = !navOpen;
  };

  const mobileQueryChanged = (e) => {
    mobileNav = e.matches;
    navOpen = false;
  };

  const onScroll = () => {
    currentSection = 'none';
    scrollY = window.scrollY;

    if (mobileNav) return;

    navItems.forEach(item => {
      if (!item || !item.id) return;

      const element = document.getElementById(item.id);
      if (!element) return

      const offsetTop = element.offsetTop;
      if (scrollY >= offsetTop-10) {
        currentSection = item.id;
      }
    });
  }

  onMount(() => {
    const mobileQuery = window.matchMedia('(max-width: 730px)');
    mobileQueryChanged(mobileQuery);
    mobileQuery.addEventListener("change", mobileQueryChanged);
    isHomepage = window.location.pathname === "/";
    scrollY = window.scrollY;
    onScroll();

    document.addEventListener("scroll", (e) => {
      onScroll();
    });
  });
</script>

<nav
  class={`navbar ${navOpen && mobileNav ? "open" : ""} ${
    scrollY > navbarHeight || !isHomepage ? "opaque" : ""
  }`}
  style="--navbar-height:{`${navbarHeight}px`}"
>
  {#if mobileNav}
    <button on:click={toggleNav} class="nav-toggle-button">
      <!-- Open mobile menu icon -->
      <svg class={`toggle-button ${!navOpen ? "active" : ""}`}>
        <use href="/icons.svg#bars" />
      </svg>

      <!-- Close mobile menu icon -->
      <svg class={`toggle-button ${navOpen ? "active" : ""}`}>
        <use href="/icons.svg#xmark" />
      </svg>
    </button>
  {/if}

  <ul class={`navlinks ${mobileNav ? "mobile" : ""}`}>
    <!-- Navbar Links -->
    {#each navItems as item}
      <li class={`navlink ${currentSection == item.id ? "active" : ""}`}>
        <a on:click={() => {toggleNav(); /** navbar tracking goes here */}} href={item.href} rel="noopener" aria-label={item.label}>{item.label}</a>
      </li>
    {/each}
  </ul>

</nav>

<style>
  .navbar {
    position: fixed;
    width: 100%;
    height: var(--navbar-height);
    padding: 0;
    margin: 0;
    top: 0;
    z-index: 1000;
    transition: 0.3s;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .navbar.opaque {
    background-color: #252525;
  }

  .navbar.open {
    height: 100vh;
    background-color: #252525;
  }

  .nav-toggle-button {
    width: 100%;
    border: none;
    height: var(--navbar-height);
    background-color: rgba(0, 0, 0, 0);
  }

  .navlinks {
    margin: 0;
    padding: 0;
    width: 100%;
    max-width: 1000px;
    height: 100%;
    list-style: none;
    display: flex;
    flex-direction: row;
  }

  .navlinks button {
    background-color: rgba(0, 0, 0, 0);
  }

  .navlinks.mobile {
    flex-direction: column;
    justify-content: start;
    overflow: hidden;
  }

  .navlink {
    padding: 0;
    border: 0;
    width: 100%;
    min-width: 120px;
    height: var(--navbar-height);
    line-height: var(--navbar-height);
    text-align: center;
    font-weight: 300;
  }

  .navlink a {
    width: 100%;
    display: inline-block;
    height: 100%;
    color: white;
    text-decoration: none;
  }

  .navlink.active {
    box-shadow:inset 0px 5px 0px 0px rgba(255, 255, 255, 0.75);
  }

  .navbar a:hover {
    background-color: #252525;
  }

  .navbar.opaque a:hover {
    background-color: #555;
  }

  .toggle-button {
    width: 1.5rem;
    height: 100%;
    fill: white;
    cursor: pointer;
    display: none;
  }

  .toggle-button.active {
    display: inline-block;
  }
</style>
