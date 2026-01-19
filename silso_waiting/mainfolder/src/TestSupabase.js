import React, { useEffect, useState } from 'react';
import { supabase } from './supabaseClient';

function TestSupabase() {
  const [tables, setTables] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    testConnection();
  }, []);

  const testConnection = async () => {
    try {
      const { data, error } = await supabase
        .from('information_schema.tables')
        .select('table_name')
        .eq('table_schema', 'public')
        .limit(5);

      if (error) {
        setError(error.message);
      } else {
        setTables(data || []);
      }
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ padding: '20px' }}>
      <h2>Supabase Connection Test</h2>
      {loading && <p>Testing connection...</p>}
      {error && <p style={{ color: 'red' }}>Error: {error}</p>}
      {!loading && !error && (
        <div>
          <p style={{ color: 'green' }}>✓ Successfully connected to Supabase!</p>
          <p>Database URL: https://swqinyxpbnsabhkrtgyy.supabase.co</p>
        </div>
      )}
    </div>
  );
}

export default TestSupabase;